defmodule AdaBe.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string
      add :description, :string
      add :id_group, :integer

      timestamps()
    end

    create unique_index(:groups, [:name, :id_group])
  end
end
