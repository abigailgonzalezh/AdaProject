defmodule AdaBe.Select.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :group_id, :integer
    belongs_to (:user, AdaBe.Accounts.User)

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
