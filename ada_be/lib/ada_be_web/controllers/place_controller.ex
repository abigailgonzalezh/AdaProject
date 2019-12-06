defmodule AdaBeWeb.PlaceController do
    use AdaBeWeb, :controller

    alias AdaBe.Menu.Place

    def index(conn, _params) do
      IO.puts "---------------------------------------------"
      IO.inspect place = AdaBeWeb.Guardian.Plug.current_resource(conn)
      json(conn, %{msg: "Hello #{place.name}"})
    end

    def create(conn, %{"place" => place_params}) do
        
    end

    def show(conn, %{"id" => id}) do
        IO.puts "---------------------------------------------"
        IO.inspect individual_place = AdaBeWeb.Guardian.Plug.current_resource(conn)
        json(conn, %{msg: "Aqui estoy"})
    end
end