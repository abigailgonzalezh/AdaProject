defmodule AdaBe.Menu.Place do
  use Ecto.Schema
  import Ecto.Changeset

  schema "places" do
    field :description, :string
    field :id_places, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(place, attrs) do
    place
    |> cast(attrs, [:id_places, :name, :description])
    |> validate_required([:id_places, :name, :description])
    |> unique_constraint(:id_places)
  end
end
