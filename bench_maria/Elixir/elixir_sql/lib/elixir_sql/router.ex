defmodule ElixirSql.Router do
  # Bring Plug.Router module into scope to handle incoming requests
  use Plug.Router

  # Attach the Logger to log incoming requests
  plug(Plug.Logger)

  # Tell Plug to match the incoming request with the defined endpoints
  plug(:match)

  # Once there is a match, parse the response body if the content-type
  # is application/json. The order is important here, as we only want to
  # parse the body if there is a matching route.(Using the Jayson parser)
  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  # Dispatch the connection to the matched handler
  plug(:dispatch)

  # Handler for GET request with "/" path
  get "/" do
    send_resp(conn, 200, "OK")
  end

  get "/health" do
    # NOTE using the bang version of MyXQL.query! will NOT return an :ok or :error
    case MyXQL.query(:myxql, "SELECT NOW()") do
      {:ok, res} -> send_resp(conn, 200, inspect(res))
      {:error, reason} -> send_resp(conn, 500, "DB Error: #{inspect(reason)}")
      _ -> send_resp(conn, 200, "Unknown Error")
    end
  end

  get "/api/retailers" do
    retailers = MyXQL.query(:myxql, "SELECT * FROM retailers")

    conn
    |> put_resp_header("content-type", "application/json")
    |> send_resp(200, inspect(retailers))
  end

  get "/api/retailer/:id" do
    id = conn.params["id"]
    retailer = MyXQL.query(:myxql, "SELECT * FROM retailers WHERE id = ?", [id])

    conn
    |> put_resp_header("content-type", "application/json")
    |> send_resp(200, inspect(retailer))
  end

  # Fallback handler when there was no match
  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
