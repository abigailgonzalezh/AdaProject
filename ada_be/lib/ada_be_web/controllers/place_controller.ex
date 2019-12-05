defmodule AdaBeWeb.PlaceController do
    use AdaBeWeb, :controller

    def index(conn, _params) do
      IO.puts "---------------------------------------------"
      IO.inspect user = AuthBeWeb.Guardian.Plug.current_resource(conn)
      json(conn, %{msg: "Hello #{user.username}"})
    end
end