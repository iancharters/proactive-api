# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :proactive_api,
  namespace: ProactiveAPI,
  ecto_repos: [ProactiveAPI.Repo]

# Configures the endpoint
config :proactive_api, ProactiveAPIWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  render_errors: [view: ProactiveAPIWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ProactiveAPI.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Guardian
config :proactive_api, ProactiveAPIWeb.Guardian,
  issuer: "proactive_api",
  ttl: {30, :days},
  verify_issuer: true
  # serializer: ProactiveAPI.GuardianSerializer

config :cors_plug,
  origin: ["http://localhost:3000", "http://localhost:4000"]

  # Import environment specific config. This must remain at the bottom
  # of this file so it overrides the configuration defined above.
  import_config "#{Mix.env}.exs"
