defmodule AdaBe.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :email, :string
    field :hashed_password, :string
    has_many(:places, AdaBe.Menu.Place)
    many_to_many(:groups, AdaBe.Menu.Group, join_through: "user_groups", on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :password_confirmation, :email])
    |> validate_required([:username, :password, :password_confirmation, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> put_hashed_password()
  end


  defp put_hashed_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :hashed_password, Comeonin.Pbkdf2.hashpwsalt(password))
      _ ->
        changeset
    end
  end

end
