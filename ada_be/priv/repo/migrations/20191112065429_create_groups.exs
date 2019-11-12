defmodule AdaBe.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :group_id, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:groups, [:group_id])
    create index(:groups, [:user_id])
  end
end
