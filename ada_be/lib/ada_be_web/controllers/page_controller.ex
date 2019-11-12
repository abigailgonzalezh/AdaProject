defmodule AdaBeWeb.PageController do
  use AdaBeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
