defmodule AdaBeWeb.GroupController do
    use AdaBeWeb, :controller
    import Ecto.Query, only: [from: 2]

    alias AdaBe.Menu.Group
    alias AdaBe.Accounts.User
    alias AdaBe.Repo

    def index(conn, _params) do
        user = AdaBeWeb.Guardian.Plug.current_resource(conn)
        
    end

    def create(conn, %{"group" => group_params}) do
        user = AdaBeWeb.Guardian.Plug.current_resource(conn)
        group = Group.changeset(%Group{}, group_params)
        Repo.insert!(group)
        user = Repo.preload(user, [:places])
        user_changeset = Ecto.Changeset.change(user)
        user_groups_changeset = user_changeset |> Ecto.Changeset.put_assoc(:groups, [group])
        Repo.update!(user_groups_changeset)

        IO.inspect "==============================="

        json(conn, %{msg: "Group successfully registered"})
    end
end