defmodule AdaBe.Menu.Place do
  use Ecto.Schema
  import Ecto.Changeset

  schema "places" do
    field :description, :string
    field :name, :string
    belongs_to(:user, AdaBe.Accounts.User)

    timestamps()
  end

  @doc false
  def changeset(place, attrs) do
    place
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
