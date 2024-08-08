import Config

config :elixir_sql, port: 8000

# DB config
config :elixir_sql, db_user: "retailer"
config :elixir_sql, db_pass: "retailer"
config :elixir_sql, db_db: "retailer_api"
config :elixir_sql, db_port: 3506

# Do not print debug messages in production
config :logger, level: :alert
