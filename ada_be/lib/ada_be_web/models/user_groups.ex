defmodule AdaBeWeb.UserGroups do
    import Ecto.Changeset
    use Ecto.Schema

    schema "user_groups" do
        belongs_to(:user, AdaBe.Accounts.User)
        belongs_to(:group, AdaBe.Menu.Group)

    timestamps()
    end

    def changeset(user_groups, attrs) do
        user_groups
        |> cast(attrs, [:user_id, :group_id])
        |> validate_required([:user_id, :group_id])
        |> unique_constraint(:user_id_group_id)
    end
end