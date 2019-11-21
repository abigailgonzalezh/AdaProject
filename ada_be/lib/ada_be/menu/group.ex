defmodule AdaBe.Menu.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :description, :string
    field :id_groups, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:id_groups, :name, :description])
    |> validate_required([:id_groups, :name, :description])
    |> unique_constraint(:id_groups)
  end
end
