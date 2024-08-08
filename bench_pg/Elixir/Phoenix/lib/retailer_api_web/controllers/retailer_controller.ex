defmodule RetailerApiWeb.RetailerController do
  use RetailerApiWeb, :controller

  alias RetailerApi.Admin
  alias RetailerApi.Admin.Retailer

  action_fallback RetailerApiWeb.FallbackController

  def index(conn, _params) do
    retailers = Admin.list_retailers()
    render(conn, :index, retailers: retailers)
  end

  def create(conn, %{"retailer" => retailer_params}) do
    with {:ok, %Retailer{} = retailer} <- Admin.create_retailer(retailer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/retailers/#{retailer}")
      |> render(:show, retailer: retailer)
    end
  end

  def show(conn, %{"id" => id}) do
    retailer = Admin.get_retailer!(id)
    render(conn, :show, retailer: retailer)
  end

  def update(conn, %{"id" => id, "retailer" => retailer_params}) do
    retailer = Admin.get_retailer!(id)

    with {:ok, %Retailer{} = retailer} <- Admin.update_retailer(retailer, retailer_params) do
      render(conn, :show, retailer: retailer)
    end
  end

  def delete(conn, %{"id" => id}) do
    retailer = Admin.get_retailer!(id)

    with {:ok, %Retailer{}} <- Admin.delete_retailer(retailer) do
      send_resp(conn, :no_content, "")
    end
  end
end
