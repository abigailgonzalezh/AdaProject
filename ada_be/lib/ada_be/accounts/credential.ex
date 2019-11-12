defmodule AdaBe.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset

  schema "credentials" do
    field :mail, :string
    field :password_hash, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:mail, :password_hash])
    |> validate_required([:mail, :password_hash])
    |> unique_constraint(:mail)
  end
end
