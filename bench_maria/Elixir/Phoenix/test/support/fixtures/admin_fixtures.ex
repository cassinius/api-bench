defmodule RetailerApi.AdminFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RetailerApi.Admin` context.
  """

  @doc """
  Generate a retailer.
  """
  def retailer_fixture(attrs \\ %{}) do
    {:ok, retailer} =
      attrs
      |> Enum.into(%{
        Business_name: "some Business_name",
        Contact_address: "some Contact_address",
        Contact_emailId: "some Contact_emailId",
        Contact_number: 42,
        Contact_person: "some Contact_person",
        GSTIN: "some GSTIN",
        Outlet_limit: 42,
        Status: "some Status",
        id: 42
      })
      |> RetailerApi.Admin.create_retailer()

    retailer
  end
end
