defmodule AdaBe.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :id_usuario, :integer
    field :username, :string
    has_one:credential, AdaBe.Auth.Credential

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:id_usuario, :username])
    |> validate_required([:id_usuario, :username])
    |> unique_constraint(:id_usuario)
  end
end