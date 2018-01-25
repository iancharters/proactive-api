defmodule ProactiveAPIWeb.Router do
  use ProactiveAPIWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :unauthorized do
    plug :fetch_session
  end

  pipeline :authorized do
    plug :fetch_session
    plug Guardian.Plug.Pipeline, module: ProactiveAPIWeb.Guardian,
      error_handler: ProactiveAPIWeb.AuthErrorController
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  scope "/api", ProactiveAPIWeb do
    pipe_through :api


    scope "/" do
      pipe_through :unauthorized

      post "/sessions", SessionController, :create
      resources "/users", UserController, only: [:create]
    end

    scope "/" do
      pipe_through :authorized

      delete "/sessions", SessionController, :delete
      post "/sessions/refresh", SessionController, :refresh
    end
  end
end
