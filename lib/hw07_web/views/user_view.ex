defmodule Hw07Web.UserView do
  use Hw07Web, :view
  alias Hw07Web.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      password_hash: user.password_hash,
      email: user.email,
      ismanager: user.ismanager,
      managerid: user.managerid}
  end
end
