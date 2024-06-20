defmodule RetailerApiWeb.RetailerControllerTest do
  use RetailerApiWeb.ConnCase

  import RetailerApi.AdminFixtures

  alias RetailerApi.Admin.Retailer

  @create_attrs %{
    id: 42,
    GSTIN: "some GSTIN",
    Business_name: "some Business_name",
    Contact_person: "some Contact_person",
    Contact_number: 42,
    Contact_address: "some Contact_address",
    Contact_emailId: "some Contact_emailId",
    Status: "some Status",
    Outlet_limit: 42
  }
  @update_attrs %{
    id: 43,
    GSTIN: "some updated GSTIN",
    Business_name: "some updated Business_name",
    Contact_person: "some updated Contact_person",
    Contact_number: 43,
    Contact_address: "some updated Contact_address",
    Contact_emailId: "some updated Contact_emailId",
    Status: "some updated Status",
    Outlet_limit: 43
  }
  @invalid_attrs %{id: nil, GSTIN: nil, Business_name: nil, Contact_person: nil, Contact_number: nil, Contact_address: nil, Contact_emailId: nil, Status: nil, Outlet_limit: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all retailers", %{conn: conn} do
      conn = get(conn, ~p"/api/retailers")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create retailer" do
    test "renders retailer when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/retailers", retailer: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/retailers/#{id}")

      assert %{
               "id" => ^id,
               "Business_name" => "some Business_name",
               "Contact_address" => "some Contact_address",
               "Contact_emailId" => "some Contact_emailId",
               "Contact_number" => 42,
               "Contact_person" => "some Contact_person",
               "GSTIN" => "some GSTIN",
               "Outlet_limit" => 42,
               "Status" => "some Status",
               "id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/retailers", retailer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update retailer" do
    setup [:create_retailer]

    test "renders retailer when data is valid", %{conn: conn, retailer: %Retailer{id: id} = retailer} do
      conn = put(conn, ~p"/api/retailers/#{retailer}", retailer: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/retailers/#{id}")

      assert %{
               "id" => ^id,
               "Business_name" => "some updated Business_name",
               "Contact_address" => "some updated Contact_address",
               "Contact_emailId" => "some updated Contact_emailId",
               "Contact_number" => 43,
               "Contact_person" => "some updated Contact_person",
               "GSTIN" => "some updated GSTIN",
               "Outlet_limit" => 43,
               "Status" => "some updated Status",
               "id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, retailer: retailer} do
      conn = put(conn, ~p"/api/retailers/#{retailer}", retailer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete retailer" do
    setup [:create_retailer]

    test "deletes chosen retailer", %{conn: conn, retailer: retailer} do
      conn = delete(conn, ~p"/api/retailers/#{retailer}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/retailers/#{retailer}")
      end
    end
  end

  defp create_retailer(_) do
    retailer = retailer_fixture()
    %{retailer: retailer}
  end
end
