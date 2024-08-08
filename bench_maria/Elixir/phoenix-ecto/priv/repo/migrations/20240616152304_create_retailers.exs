defmodule RetailerApi.Repo.Migrations.CreateRetailers do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:retailers) do
      # add :id, :integer
      add :GSTIN, :string
      add :Business_name, :string
      add :Contact_person, :string
      add :Contact_number, :integer
      add :Contact_address, :string
      add :Contact_emailId, :string
      add :Status, :string
      add :Outlet_limit, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
