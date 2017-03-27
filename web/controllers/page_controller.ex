defmodule LoveTime.PageController do
  use LoveTime.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
