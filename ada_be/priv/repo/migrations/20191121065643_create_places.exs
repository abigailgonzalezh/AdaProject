defmodule AdaBe.Repo.Migrations.CreatePlaces do
  use Ecto.Migration

  def change do
    create table(:places) do
      add :id_places, :integer
      add :name, :string
      add :description, :string

      timestamps()
    end

    create unique_index(:places, [:id_places])
  end
end
