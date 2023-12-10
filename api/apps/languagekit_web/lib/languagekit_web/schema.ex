defmodule LanguagekitWeb.Schema do
  use Absinthe.Schema


  query do
    @desc "Hello World"
    field :hello_world, :string do
      resolve(fn _, _ ->
        {:ok, "Hello World"}
      end)
    end
  end
end
