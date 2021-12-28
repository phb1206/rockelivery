defmodule RockeliveryWeb.ItemController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Items.{Create, Delete, Get, Item, Update}

  action_fallback RockeliveryWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Item{} = item} <- Create.call(params) do
      conn
      |> put_status(:ok)
      |> render("create.json", item: item)
    end
  end

  def show(conn, params) do
    with {:ok, %Item{} = item} <- Get.by_id(params["id"]) do
      conn
      |> put_status(:ok)
      |> render("show.json", item: item)
    end
  end

  def delete(conn, params) do
    with {:ok, %Item{} = item} <- Delete.call(params["id"]) do
      conn
      |> put_status(:ok)
      |> render("delete.json", item: item)
    end
  end

  def update(conn, params) do
    with {:ok, %Item{} = item} <- Update.call(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", item: item)
    end
  end
end
