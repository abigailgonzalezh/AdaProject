defmodule AdaBe.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :mail, :string, null: false
      add :password_hash, :string
      add :id_usuario, :integer
      add :username, :string
      add :is_active, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:users, [:mail])
    create unique_index(:users, [:id_usuario])
  end
end
