defmodule Rockelivery.Orders.Delete do
  alias Ecto.UUID
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.Orders.Order

  def call(id) do
    with {:ok, _} <- UUID.cast(id),
         %Order{} = order <- Repo.get(Order, id) do
      Repo.delete(order)
    else
      :error -> {:error, Error.build(:bad_request, "Invalid ID")}
      nil -> {:error, Error.build(:not_found, "Order not found")}
    end
  end
end
