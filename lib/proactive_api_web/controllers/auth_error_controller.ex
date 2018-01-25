defmodule ProactiveAPIWeb.AuthErrorController do
  import Plug.Conn
  use ProactiveAPIWeb, :controller

  def auth_error(conn, {_type, _reason}, _opts) do
    conn
    |> put_status(:unauthorized)
    |> render(ProactiveAPIWeb.SessionView, "wrong_credentials.json")
  end
end
