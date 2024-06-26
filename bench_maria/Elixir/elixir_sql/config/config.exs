import Config

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# config_env() returns the current Mix environment (set by MIX_ENV)
import_config "#{config_env()}.exs"
