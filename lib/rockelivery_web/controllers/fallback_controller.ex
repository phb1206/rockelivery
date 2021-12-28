defmodule RockeliveryWeb.FallbackController do
  use RockeliveryWeb, :controller

  def call(conn, {:error, %{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(RockeliveryWeb.ErrorView)
    |> render("error.json", result: result)
  end
end
