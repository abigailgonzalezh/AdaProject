defmodule AdaBeWeb.Router do
  use AdaBeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AdaBeWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
    resources "/places", PlaceController
    resources "/groups", GroupController
  end

  # Other scopes may use custom stacks.
  # scope "/api", AdaBeWeb do
  #   pipe_through :api
  # end
end
