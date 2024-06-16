defmodule RetailerApi.Admin.Retailer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "retailers" do
    # field :id, :integer
    field :GSTIN, :string
    field :Business_name, :string
    field :Contact_person, :string
    field :Contact_number, :integer
    field :Contact_address, :string
    field :Contact_emailId, :string
    field :Status, :string
    field :Outlet_limit, :integer

    # timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(retailer, attrs) do
    retailer
    |> cast(attrs, [:GSTIN, :Business_name, :Contact_person, :Contact_number, :Contact_address, :Contact_emailId, :Status, :Outlet_limit])
    |> validate_required([:GSTIN, :Business_name, :Contact_person, :Contact_number, :Contact_address, :Contact_emailId, :Status, :Outlet_limit])
  end
end
