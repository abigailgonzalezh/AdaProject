defmodule AdaBe.Select.Place do
  use Ecto.Schema
  import Ecto.Changeset

  schema "places" do
    field :name, :string
    field :places_id, :integer
    belongs_to (:user, AdaBe.Accounts.User)

    timestamps()
  end

  @doc false
  def changeset(place, attrs) do
    place
    |> cast(attrs, [:places_id, :name])
    |> validate_required([:places_id, :name])
    |> unique_constraint(:places_id)
    |> unique_constraint(:name)
  end
end
