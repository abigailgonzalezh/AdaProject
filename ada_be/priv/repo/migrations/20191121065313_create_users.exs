defmodule AdaBe.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :id_user, :integer
      add :email, :string
      add :username, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:users, [:id_user])
    create unique_index(:users, [:email])
  end
end
