use Mix.Config

config :proactive_api, ProactiveAPI.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "USERNAME_HERE",
  password: "PASSWORD_HERE"
