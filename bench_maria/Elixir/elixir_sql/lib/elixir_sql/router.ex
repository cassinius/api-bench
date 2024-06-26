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
    # TODO still got no clue about Elixir pattern matching...
    #  case MyXQL.query!(:myxql, "SELECT NOW()").rows do
    #   {_, _res} -> send_resp(conn, 200, "OK")
    #   {:error, _reason} -> send_resp(conn, 500, "DB Error")
    #   # _ -> send_resp(conn, 200, "OK")
    #  end

     send_resp(conn, 200, MyXQL.query!(:myxql, "SELECT NOW()").rows)
  end

  get "/api/retailers" do
    send_resp(conn, 200, "OK ALL Retailers")
  end

  get "/api/retailer/:id" do
    id = conn.params["id"]
    send_resp(conn, 200, "OK Retailer ##{id}")
  end

  # Fallback handler when there was no match
  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
