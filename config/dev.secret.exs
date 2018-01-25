use Mix.Config

config :proactive_api, ProactiveAPI.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "YOUR_USERNAME_HERE",
  password: "YOUR_PASSWORD_HERE",
