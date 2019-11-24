# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ada_be,
  ecto_repos: [AdaBe.Repo]

# Configures the endpoint
config :ada_be, AdaBeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "l5Gxame3E4uBEB/FRlN0HlEod+XFjmI/cAwJSGCwEYjE6vRXDrXbE1nqLrVmz0Vb",
  render_errors: [view: AdaBeWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: AdaBe.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  base_path: "/api/auth",
  providers: [
    identity: {Ueberauth.Strategy.Identity, [
      callback_methods: ["POST"],
      nickname_field: :username,
      param_nesting: "user",
      uid_field: :username
    ]}
  ]

  config :ada_be, AdaBeWeb.AuthAccessPipeline,
    module: AdaBeWeb.Guardian,
    error_handler: AdaBeWeb.AuthErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
