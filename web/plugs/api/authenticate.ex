defmodule LoveTime.Api.Plugs.Authenticate do
  import Plug.Conn
  import Ecto.Query

  def init(options) do
    options
  end

  def call(conn, _) do
    result = validate_token(conn.params["token"])
    case result do
      :missing_token -> 
        conn |> send_resp(401, "Missing valid API token") |> halt
      :invalid_token ->
        conn |> send_resp(401, "Invalid API token") |> halt
      { :authenticated, user } ->
        conn |> assign(:current_user, user)
    end
  end

  def validate_token(token) do
    case token do
      nil -> :missing_token
      _ -> assign_user(token)
    end
  end

  def assign_user(token) do
    user = LoveTime.User 
      |> where([u], u.authentication_token == ^token)
      |> LoveTime.Repo.one
    
    case user do
      nil -> :invalid_token
      _ -> { :authenticated, user }
    end
  end

end