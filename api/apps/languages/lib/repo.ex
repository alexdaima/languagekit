defmodule Languages.Repo do
  use Ecto.Repo,
    otp_app: :languages,
    adapter: Ecto.Adapters.Postgres
end
