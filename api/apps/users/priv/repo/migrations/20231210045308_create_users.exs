defmodule Users.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do

    create table(:users, primary_key: false) do
      add :id, :string, primary_key: true
      add :username, :string, unique: true, null: false
      add :password, :string, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create unique_index(:users, [:username])
  end
end
