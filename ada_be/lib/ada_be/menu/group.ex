defmodule AdaBe.Menu.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :name, :string
    field :description, :string
    field :id_group, :integer
    many_to_many(:users, AdaBe.Accounts.User, join_through: "user_groups", on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
    |> unique_constraint(:name)
    |> unique_constraint(:id_group)
  end
end
