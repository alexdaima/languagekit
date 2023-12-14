defmodule Users.Users.Schema do
  use Absinthe.Schema.Notation

  alias Users.{Repo, Users.User}

  object :UserAuth do
    field(:token, non_null(:string))
    field(:user, non_null(:User))
  end

  object :User do
    field(:id, non_null(:id))
    field(:username, non_null(:string))
  end

  object :users_users_queries do
    @desc "Get user info"
    field :user, non_null(:User) do
      arg(:id, non_null(:id))

      resolve(fn %{id: id}, _info ->
        Repo.get(User, id)
      end)
    end
  end

  object :users_users_mutations do
    @desc "Login"
    field :login, non_null(:UserAuth) do
      arg(:username, non_null(:string))
      arg(:password, non_null(:string))

      resolve(fn %{username: username, password: password}, _info ->
        case Repo.get_by(User, username: username) do
          nil ->
            {:error, "Could not find a user with this username"}

          user ->
            case Argon2.verify_pass(password, user.password) do
              true ->
                session_id = Ulid.generate()
                Users.Cache.cache(session_id, user.id, 12 * 60 * 60)

                {:ok, token, _claims} =
                  Users.Guardian.encode_and_sign(session_id, %{}, ttl: {12, :hours})

                {:ok, %{user: user, token: token}}

              false ->
                {:error, "Invalid username or password"}
            end
        end
      end)
    end

    @desc "Sign Up"
    field :signup, non_null(:UserAuth) do
      arg(:username, non_null(:string))
      arg(:password, non_null(:string))

      resolve(fn %{username: username, password: password}, _info ->
        case Repo.get_by(User, username: username) do
          nil ->
            new_user_id = Ecto.UUID.generate()

            attrs = %{
              :username => username |> String.downcase(),
              :password => Argon2.hash_pwd_salt(password)
            }

            {status, user} = %User{id: new_user_id} |> User.changeset(attrs) |> Repo.insert()

            case status do
              :ok ->
                session_id = Ulid.generate()
                Users.Cache.cache(session_id, user.id, 12 * 60 * 60)

                {:ok, token, _claims} =
                  Users.Guardian.encode_and_sign(session_id, %{}, ttl: {12, :hours})

                {:ok, %{user: user, token: token}}

              _ ->
                {:error, "Something went wrong with the signup"}
            end

          _user ->
            {:error, "A user already exists with this username"}
        end
      end)
    end
  end
end
