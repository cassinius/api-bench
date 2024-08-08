# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :retailer_api,
  ecto_repos: [RetailerApi.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :retailer_api, RetailerApiWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: RetailerApiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: RetailerApi.PubSub,
  live_view: [signing_salt: "C1vLMPid"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason / Jiffy for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
# config :phoenix, :json_library, Jiffy

# config :phoenix, :format_encoders,
#   json: Phoenix.Jiffy

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
