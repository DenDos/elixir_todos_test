
defmodule CryptosatoServicesWeb.V1.CurrencyController do
  use CryptosatoServicesWeb, :controller

  action_fallback CryptosatoServicesWeb.FallbackController
  alias CryptosatoServices.Services.CryptowatService

  def cryptowat(conn, _params) do 
    with { :ok, currencies } <- CryptowatService.parse_currencies() do
      render(conn, "cryptowat.json", response: currencies)
    end
  end

end
