import Config

# Do not print anything below alert in production
# Do not print anything below alert in production
config :logger,
  level: :error,
  compile_time_purge_matching: [
    [level_lower_than: :error]
  ]

# Runtime production configuration, including reading
# of environment variables, is done on config/runtime.exs.
