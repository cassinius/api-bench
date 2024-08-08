defmodule RetailerApiWeb.Router do
  use RetailerApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RetailerApiWeb do
    pipe_through :api

    get "/retailers", RetailerController, :index
    get "/retailer/:id", RetailerController, :show
    # post "/retailer", RetailerController, :create
    # put "/retailer/:id", RetailerController, :update
    # delete "/retailer/:id", RetailerController, :delete

    # resources "/retailer", RetailerController, only: [:create, :update, :delete]
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:retailer_api, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: RetailerApiWeb.Telemetry
    end
  end
end
