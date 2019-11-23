defmodule AdaBe.Repo.Migrations.UserGroups do
  use Ecto.Migration

  def change do
    create table(:user_groups, primary_key: false) do
      add(:user_id, references(:users, on_delete: :delete_all), primary_key: true)
      add(:group_id, references(:groups, on_delete: :delete_all), primary_key: true)
  end

  create(index(:user_groups, [:user_id]))
  create(index(:user_groups, [:group_id]))

  create(
    unique_index(:user_groups, [:user_id, :group_id], name: :user_id_group_id_unique_index)
  )
  end
end
