defmodule RockeliveryWeb.OrderView do
  use RockeliveryWeb, :view

  alias Rockelivery.Orders.Order

  def render("create.json", %{order: %Order{} = order}) do
    %{
      message: "Order created!",
      order: order
    }
  end

  def render("show.json", %{order: %Order{} = order}) do
    %{
      message: "Order found!",
      order: order
    }
  end

  def render("delete.json", %{order: %Order{} = order}) do
    %{
      message: "Order deleted!",
      order: order
    }
  end
end
