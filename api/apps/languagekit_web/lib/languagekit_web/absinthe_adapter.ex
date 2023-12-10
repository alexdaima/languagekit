defmodule LanguagekitWeb.AbsintheAdapter do
  use Absinthe.Adapter

  def to_internal_name(camelcase_name, _role) do
    camelcase_name |> Macro.underscore()
  end

  def to_external_name(snakecase_name, _role) do
    case String.match?(snakecase_name, ~r/^([^_]*(_[^_])?)*_?$/) do
      true ->
        Inflex.camelize(snakecase_name, :lower)

      false ->
        snakecase_name
        |> String.split("__")
        |> Enum.map(fn x -> x |> Inflex.camelize(:lower) end)
        |> Enum.join("__")
    end
  end
end
