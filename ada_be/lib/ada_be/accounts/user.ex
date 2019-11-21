defmodule AdaBe.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :id_user, :integer
    field :password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:id_user, :email, :username, :password])
    |> validate_required([:id_user, :email, :username, :password])
    |> unique_constraint(:id_user)
    |> unique_constraint(:email)
  end
end
