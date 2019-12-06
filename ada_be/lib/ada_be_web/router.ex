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
    post "/registration", RegistrationController, :register
  end
 
   scope "/api", AdaBeWeb do
    pipe_through [:api, :authenticated]

    get "/places", PlaceController, :index
    post "/places", PlaceController, :create
   end
end
