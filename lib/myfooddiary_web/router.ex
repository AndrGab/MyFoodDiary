defmodule MyfooddiaryWeb.Router do
  use MyfooddiaryWeb, :router

  alias MyfooddiaryWeb.Plugs.UUIDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug UUIDChecker
  end

  scope "/api", MyfooddiaryWeb do
    pipe_through :api

    get "/", RedirectController, :index
    resources "/meals", MealsController, except: [:new, :edit]
    get "/meals/users/:id", MealsController, :showuser
    resources "/users", UsersController, except: [:new, :edit]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: MyfooddiaryWeb.Telemetry
    end
  end
end
