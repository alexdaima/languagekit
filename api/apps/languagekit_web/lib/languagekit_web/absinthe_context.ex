defmodule Languagekit.Absinthe.Context do
  @behaviour Plug

  def init(opts), do: opts

  def call(conn, _opts) do
    Absinthe.Plug.put_options(conn, context: %{})
  end

end
