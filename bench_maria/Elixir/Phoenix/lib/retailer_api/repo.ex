defmodule RetailerApi.Repo do
  use Ecto.Repo,
    otp_app: :retailer_api,
    adapter: Ecto.Adapters.MyXQL
end
