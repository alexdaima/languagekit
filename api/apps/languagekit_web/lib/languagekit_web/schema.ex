defmodule LanguagekitWeb.Schema do
  use Absinthe.Schema

  import_types(Users.Users.Schema)

  query do
    import_fields(:users_users_queries)

    @desc "Get SDL"
    field :sdl, :string do
      resolve(fn _, _, _ ->
        pipeline =
          __MODULE__
          |> Absinthe.Pipeline.for_schema(prototype_schema: __MODULE__.__absinthe_prototype_schema__())
          |> Absinthe.Pipeline.upto({Absinthe.Phase.Schema.Validation.Result, pass: :final})
          |> Absinthe.Schema.apply_modifiers(__MODULE__)

        with {:ok, blueprint, _phases} <- Absinthe.Pipeline.run(
          __MODULE__.__absinthe_blueprint__(),
          pipeline
        ) do
          {:ok, inspect(blueprint, pretty: true)}
        else
          _ -> {:error, "Failed to render schema"}
        end
      end)
    end

    @desc "Hello World"
    field :hello_world, non_null(:string) do
      resolve(fn _, _, %{context: %{user_id: user_id}} ->
        {:ok, "Hello World #{user_id}"}
      end)
    end
  end

  mutation do
    import_fields(:users_users_mutations)
  end
end
