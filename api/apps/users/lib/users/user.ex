defmodule Users.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: false}
  @timestamps_opts [type: :naive_datetime_usec]
  schema "users" do
    field(:username, :string)
    field(:password, :string)
    timestamps()
  end

  @doc false
  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [
      :id,
      :username,
      :password
    ])
    |> validate_required([:username, :password])
  end
end
