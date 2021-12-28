defmodule RockeliveryWeb.ItemView do
  use RockeliveryWeb, :view

  alias Rockelivery.Items.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "Item created!",
      item: item
    }
  end

  def render("show.json", %{item: %Item{} = item}) do
    %{
      message: "Item found!",
      item: item
    }
  end

  def render("delete.json", %{item: %Item{} = item}) do
    %{
      message: "Item deleted!",
      item: item
    }
  end

  def render("update.json", %{item: %Item{} = item}) do
    %{
      message: "Item updated!",
      item: item
    }
  end
end
