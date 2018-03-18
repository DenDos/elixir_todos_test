defmodule CryptosatoServicesWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """

  alias CryptosatoServicesWeb.{ ErrorView, ChangesetView }

  use CryptosatoServicesWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(ChangesetView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(ErrorView, :"404")
  end

  # API Fallback
  def call(conn, {:error, :parcing_api_failed}) do
    conn
    |> put_status(:bad_request)
    |> render(ErrorView, "error.json", status: :bad_request,  message: "Parsing API Failed")
  end
end
