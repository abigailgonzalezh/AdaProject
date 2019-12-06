defmodule AdaBeWeb.Router do
  use AdaBeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug AdaBeWeb.AuthAccessPipeline
  end

  scope "/api", AdaBeWeb do
    pipe_through :api

    scope "/auth" do
      post "/identity/callback", AuthenticationController, :identity_callback
    end
  end

   scope "/api", AdaBeWeb do
    pipe_through :api

    get "/places", PlaceController, :index #renders a list of all items of the given resource type
    post "/places", PlaceController, :create #receives params for one new item and saves it in a datastore
    get "/places/:id", PlaceController, :show #renders an individual item by id
   end
end
