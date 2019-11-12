defmodule AdaBe.Repo.Migrations.CreateCredentials do
  use Ecto.Migration

  def change do
    create table(:credentials) do
      add :mail, :string
      add :password_hash, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:credentials, [:mail])
    create index(:credentials, [:user_id])
  end
end
