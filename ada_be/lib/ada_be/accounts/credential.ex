defmodule AdaBe.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Argon2

  schema "credentials" do
    field :mail, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:mail])
    |> validate_required([:mail])
    |> validate_format(:mail, ~r/@/)
    |> unique_constraint(:mail)
  end

  def registration_changeset(struct, attrs = %{})do
    struct
    |> changeset(attrs)
    |> cast(attrs, [:password, :password_confirmation])
    |> validate_required(attrs, [:password, :password_confirmation])
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> hash_password()
  end

  def hash_password(%{valid?: false} = changeset), do: changeset

  def hash_password(%{valid?: true, changes: %{password: pass}} = changeset) do
    put_change(changeset, :password_hash, Argon2.hashpwsalt(pass))
  end

end
