defmodule AdaBeWeb.GroupController do
    use AdaBeWeb, :controller
    import Ecto.Query, only: [from: 2]

    alias AdaBe.Menu.Group
    #alias AdaBe.Menu.UserGroups
    alias AdaBe.Accounts.User
    alias AdaBe.Repo

    def index(conn, _params) do
        user = AdaBeWeb.Guardian.Plug.current_resource(conn)
        names = Repo.all(from g in Group, where: g.user_id == ^user.id, select: g.id_group)
        json(conn, %{msg: "Hello", names: names})
    end
    
    def create(conn, %{"group" => group_params}) do
        user = AdaBeWeb.Guardian.Plug.current_resource(conn)
        user = Repo.preload(user, [:groups])
        group = Group.changeset(%Group{}, group_params)
        groups = user.groups ++ [group] |> Enum.map(&Ecto.Changeset.change/1)
        user
        |> Ecto.Changeset.change
        |> Ecto.Changeset.put_assoc(:groups, groups)
        |> Repo.update

        IO.inspect "==============================="

        json(conn, %{msg: "Group successfully registered"})
    end
end