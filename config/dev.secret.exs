use Mix.Config

config :proactive_api, ProactiveAPI.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "psql_dev",
  password: "psql_dev1"
