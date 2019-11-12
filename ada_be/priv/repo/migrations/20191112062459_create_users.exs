defmodule AdaBe.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :id_usuario, :integer
      add :username, :string

      timestamps()
    end

    create unique_index(:users, [:id_usuario])
  end
end
