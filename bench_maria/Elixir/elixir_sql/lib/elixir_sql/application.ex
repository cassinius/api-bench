defmodule ElixirSql.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  # The @impl true here denotes that the start function is implementing a
  # callback that was defined in the Application module
  # https://hexdocs.pm/elixir/main/Module.html#module-impl
  # This will aid the compiler to warn you when a implementaion is incorrect
  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: ElixirSql.Worker.start_link(arg)
      # {ElixirSql.Worker, arg}
      {
        Plug.Cowboy,
        scheme: :http,
        plug: ElixirSql.Router,
        options: [port: Application.get_env(:elixir_sql, :port)]
      },
      {
        MyXQL,
        name: :myxql,
        username: Application.get_env(:elixir_sql, :db_user),
        password: Application.get_env(:elixir_sql, :db_pass),
        database: Application.get_env(:elixir_sql, :db_db),
        port: Application.get_env(:elixir_sql, :db_port)
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirSql.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
