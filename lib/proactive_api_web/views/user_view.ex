defmodule ProactiveAPIWeb.UserView do
  use ProactiveAPIWeb, :view
  alias ProactiveAPIWeb.UserView

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      email: user.email}
  end
end
