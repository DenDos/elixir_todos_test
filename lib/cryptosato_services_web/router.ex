defmodule CryptosatoServicesWeb.Router do
  use CryptosatoServicesWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CryptosatoServicesWeb.V1 do
    pipe_through :api

    scope "/currencies" do
      get "/cryptowat", CurrencyController, :cryptowat
    end
  end
end
