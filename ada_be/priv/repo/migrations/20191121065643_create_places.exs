defmodule AdaBe.Repo.Migrations.CreatePlaces do
  use Ecto.Migration

  def change do
    create table(:places) do
      add :name, :string, null: false
      add :description, :string, null: false
      add :user_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create unique_index(:places, [:name])
    create index(:places, [:user_id])
  end
end
