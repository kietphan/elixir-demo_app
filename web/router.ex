defmodule LoveTime.Router do
  use LoveTime.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
    plug :put_layout, {LoveTime.LayoutView, :app}
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true  # Add this
    plug :put_layout, {LoveTime.LayoutView, :app}
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Coherence.Authentication.Token, source: :params, param: "auth_token", error: ~s'{"error":"authentication required"}'
  end

  scope "/" do
    pipe_through :browser
    coherence_routes
  end

  # Add this block
  scope "/" do
    pipe_through :protected
    coherence_routes :protected
    resources "/users", LoveTime.UserController
  end

  scope "/", LoveTime do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    # resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  scope "/api", LoveTime.Api do
    pipe_through :api
    coherence_routes :protected
    scope "/v1", V1, as: :v1 do
      resources "/users", UserController
    end
    
  end
end
