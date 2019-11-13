defmodule AdaBe.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :mail, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:mail, :is_active, :password])
    |> validate_required([:mail, :is_active, :password])
    |> unique_constraint(:mail)
    |> put_password_hash()
  end

  defp put_password_hash(
    %Ecto.Changeset{valid?: true: changes: %{password: password}} = changeset
  ) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset) do
    changeset
  end

end
