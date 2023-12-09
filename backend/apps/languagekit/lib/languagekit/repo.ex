defmodule Languagekit.Repo do
  use Ecto.Repo,
    otp_app: :languagekit,
    adapter: Ecto.Adapters.Postgres
end
