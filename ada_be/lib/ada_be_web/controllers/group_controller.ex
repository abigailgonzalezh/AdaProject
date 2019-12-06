defmodule AdaBeWeb.GroupController do
    use AdaBeWeb, :controller
    import Ecto.Query, only: [from: 2]

    alias AdaBe.Menu.Group
    alias AdaBe.Accounts.User
    alias AdaBe.Repo

    def index(conn, _params) do
        user = AdaBeWeb.Guardian.Plug.current_resource(conn)
        
    end
end