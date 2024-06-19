defmodule RetailerApi.AdminTest do
  use RetailerApi.DataCase

  alias RetailerApi.Admin

  describe "retailers" do
    alias RetailerApi.Admin.Retailer

    import RetailerApi.AdminFixtures

    @invalid_attrs %{id: nil, GSTIN: nil, Business_name: nil, Contact_person: nil, Contact_number: nil, Contact_address: nil, Contact_emailId: nil, Status: nil, Outlet_limit: nil}

    test "list_retailers/0 returns all retailers" do
      retailer = retailer_fixture()
      assert Admin.list_retailers() == [retailer]
    end

    test "get_retailer!/1 returns the retailer with given id" do
      retailer = retailer_fixture()
      assert Admin.get_retailer!(retailer.id) == retailer
    end

    test "create_retailer/1 with valid data creates a retailer" do
      valid_attrs = %{id: 42, GSTIN: "some GSTIN", Business_name: "some Business_name", Contact_person: "some Contact_person", Contact_number: 42, Contact_address: "some Contact_address", Contact_emailId: "some Contact_emailId", Status: "some Status", Outlet_limit: 42}

      assert {:ok, %Retailer{} = retailer} = Admin.create_retailer(valid_attrs)
      assert retailer.id == 42
      assert retailer.GSTIN == "some GSTIN"
      assert retailer.Business_name == "some Business_name"
      assert retailer.Contact_person == "some Contact_person"
      assert retailer.Contact_number == 42
      assert retailer.Contact_address == "some Contact_address"
      assert retailer.Contact_emailId == "some Contact_emailId"
      assert retailer.Status == "some Status"
      assert retailer.Outlet_limit == 42
    end

    test "create_retailer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_retailer(@invalid_attrs)
    end

    test "update_retailer/2 with valid data updates the retailer" do
      retailer = retailer_fixture()
      update_attrs = %{id: 43, GSTIN: "some updated GSTIN", Business_name: "some updated Business_name", Contact_person: "some updated Contact_person", Contact_number: 43, Contact_address: "some updated Contact_address", Contact_emailId: "some updated Contact_emailId", Status: "some updated Status", Outlet_limit: 43}

      assert {:ok, %Retailer{} = retailer} = Admin.update_retailer(retailer, update_attrs)
      assert retailer.id == 43
      assert retailer.GSTIN == "some updated GSTIN"
      assert retailer.Business_name == "some updated Business_name"
      assert retailer.Contact_person == "some updated Contact_person"
      assert retailer.Contact_number == 43
      assert retailer.Contact_address == "some updated Contact_address"
      assert retailer.Contact_emailId == "some updated Contact_emailId"
      assert retailer.Status == "some updated Status"
      assert retailer.Outlet_limit == 43
    end

    test "update_retailer/2 with invalid data returns error changeset" do
      retailer = retailer_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_retailer(retailer, @invalid_attrs)
      assert retailer == Admin.get_retailer!(retailer.id)
    end

    test "delete_retailer/1 deletes the retailer" do
      retailer = retailer_fixture()
      assert {:ok, %Retailer{}} = Admin.delete_retailer(retailer)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_retailer!(retailer.id) end
    end

    test "change_retailer/1 returns a retailer changeset" do
      retailer = retailer_fixture()
      assert %Ecto.Changeset{} = Admin.change_retailer(retailer)
    end
  end
end
