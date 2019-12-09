defmodule AdaBeWeb.JoinController do
    use AdaBeWeb, :controller

    alias AdaBe.Menu.Group
    alias AdaBe.Menu.UserGroups
    alias AdaBe.Accounts.User
    alias AdaBe.Repo

    def join(conn, %{"group" => group_params}) do
        user = AdaBeWeb.Guardian.Plug.current_resource(conn)
        user = Repo.preload(user, [:groups])
        group_id = String.to_integer(Map.fetch!(group_params, "id_group"))
        group = Repo.get_by(Group, id_group: group_id)
        groups = user.groups ++ [group] |> Enum.map(&Ecto.Changeset.change/1)
        user
        |> Ecto.Changeset.change
        |> Ecto.Changeset.put_assoc(:groups, groups)
        |> Repo.update
        IO.inspect "==============================="
        json(conn, %{msg: "You have been successfully registered"})
    end
end