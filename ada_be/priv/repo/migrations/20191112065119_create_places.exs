defmodule AdaBe.Repo.Migrations.CreatePlaces do
  use Ecto.Migration

  def change do
    create table(:places) do
      add :places_id, :integer
      add :name, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:places, [:places_id])
    create unique_index(:places, [:name])
    create index(:places, [:user_id])
  end
end
