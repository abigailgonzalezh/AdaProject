defmodule AdaBeWeb.PlaceController do
    use AdaBeWeb, :controller
    import Ecto.Query, only: [from: 2]

    alias AdaBe.Menu.Place
    alias AdaBe.Accounts.User
    alias AdaBe.Repo

    def index(conn, _params) do
      IO.puts "---------------------------------------------"
      IO.inspect user = AdaBeWeb.Guardian.Plug.current_resource(conn)

      names = Repo.all(from p in Place, where: p.user_id == ^user.id, select: p.name)

      json(conn, %{msg: "Hello", names: names})
    end

    def create(conn, %{"place" => place_params}) do
        AdaBeWeb.Guardian.Plug.current_resource(conn)
        |> Ecto.build_assoc(:places, params)
        |> Repo.insert!(place)
        json(conn, %{msg: "Place successfully registered"})
    end
end