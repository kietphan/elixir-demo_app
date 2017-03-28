defmodule LoveTime.Api.V1.UserController do
  use LoveTime.Web, :controller

  alias LoveTime.User

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.json", users: users)
  end

   def show(conn, %{"id" => id}) do
    user = Repo.get(User, id)
    render conn, "show.json", user: user
  end

 
end
