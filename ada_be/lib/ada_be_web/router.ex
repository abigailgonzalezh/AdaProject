defmodule AdaBeWeb.Router do
  use AdaBeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AdaBeWeb do
    pipe_through :api
  end
end
