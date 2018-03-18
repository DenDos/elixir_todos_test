defmodule CryptosatoServicesWeb.V1.CurrencyView do
  use CryptosatoServicesWeb, :view

  def render("cryptowat.json", %{response: response}) do
    %{ data: response }
  end

end