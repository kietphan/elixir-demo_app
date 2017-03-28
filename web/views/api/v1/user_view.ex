defmodule LoveTime.Api.V1.UserView do
  use LoveTime.Web, :view
  def render("index.json", %{users: users}) do
    %{data: render_many(users, LoveTime.Api.V1.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    render_one(user, LoveTime.Api.V1.UserView, "user.json")
  end

  def render("user.json", %{user: user}) do
    %{id: user.id}
  end
end
