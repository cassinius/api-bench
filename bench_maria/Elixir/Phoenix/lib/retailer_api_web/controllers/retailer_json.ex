defmodule RetailerApiWeb.RetailerJSON do
  alias RetailerApi.Admin.Retailer

  @doc """
  Renders a list of retailers.
  """
  def index(%{retailers: retailers}) do
    %{data: for(retailer <- retailers, do: data(retailer))}
  end

  @doc """
  Renders a single retailer.
  """
  def show(%{retailer: retailer}) do
    %{data: data(retailer)}
  end

  defp data(%Retailer{} = retailer) do
    %{
      id: retailer.id,
      GSTIN: retailer."GSTIN",
      Business_name: retailer."Business_name",
      Contact_person: retailer."Contact_person",
      Contact_number: retailer."Contact_number",
      Contact_address: retailer."Contact_address",
      Contact_emailId: retailer."Contact_emailId",
      Status: retailer."Status",
      Outlet_limit: retailer."Outlet_limit"
    }
  end
end
