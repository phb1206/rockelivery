defmodule RockeliveryWeb.OrderController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Orders.{Create, Delete, Get, Order}

  action_fallback RockeliveryWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Order{} = order} <- Create.call(params) do
      conn
      |> put_status(:ok)
      |> render("create.json", order: order)
    end
  end

  def show(conn, params) do
    with {:ok, %Order{} = order} <- Get.by_id(params["id"]) do
      conn
      |> put_status(:ok)
      |> render("show.json", order: order)
    end
  end

  def delete(conn, params) do
    with {:ok, %Order{} = order} <- Delete.call(params["id"]) do
      conn
      |> put_status(:ok)
      |> render("delete.json", order: order)
    end
  end
end
