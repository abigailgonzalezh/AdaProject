defmodule AdaBe.Select.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :group_id, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:group_id])
    |> validate_required([:group_id])
    |> unique_constraint(:group_id)
  end
end
