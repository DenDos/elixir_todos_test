defmodule CryptosatoServices.Services.HttpBase do
  alias Poison.Parser

  def get_request(url, _params \\ %{}) do 
    case HTTPoison.get(url) do 
      { :ok, response } -> parce(response)
      { :error, _ } -> { :error, :parcing_api_failed }
    end
  end

  def post_request(url, params \\ %{}) do 
    case HTTPoison.post(url, Poison.encode(params), [{"Content-Type", "application/json"}]) do 
      { :ok, response } -> parce(response)
      { :error, _ } -> { :error, :parcing_api_failed }
    end
  end
  
  defp parce(%{ status_code: 200, body: json_response }) do 
    Parser.parse(json_response)
  end
end