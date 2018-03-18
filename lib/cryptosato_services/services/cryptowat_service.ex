defmodule CryptosatoServices.Services.CryptowatService do
  @api_url "https://api.cryptowat.ch"
  import CryptosatoServices.Services.HttpBase

  def parse_currencies() do 
    get_request(@api_url <> "/pairs")
  end
end