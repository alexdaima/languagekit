defmodule LanguagekitWeb.Schema do
  use Absinthe.Schema

  import_types(Users.Users.Schema)

  query do
    import_fields(:users_users_queries)

    @desc "Hello World"
    field :hello_world, :string do
      resolve(fn _, _, %{context: %{user_id: user_id}} ->
        {:ok, "Hello World #{user_id}"}
      end)
    end
  end

  mutation do
    import_fields(:users_users_mutations)
  end
end
