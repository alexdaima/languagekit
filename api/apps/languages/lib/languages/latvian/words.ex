defmodule Languages.Latvian.Words do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: false}
  @timestamps_opts [type: :naive_datetime_usec]
  schema "latvian_words" do
    field(:word, :string)
    field(:user_id, :string)
    timestamps()
  end

  @doc false
  def changeset(word, attrs \\ %{}) do
    word
    |> cast(attrs, [
      :id,
      :word,
      :user_id
    ])
    |> validate_required([:word, :user_id])
  end
end
