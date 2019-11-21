defmodule AdaBe.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :id_groups, :integer
      add :name, :string
      add :description, :string

      timestamps()
    end

    create unique_index(:groups, [:id_groups])
  end
end
