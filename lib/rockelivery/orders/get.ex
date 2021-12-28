defmodule Rockelivery.Orders.Get do
  alias Ecto.UUID
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.Orders.Order

  def by_id(id) do
    with {:ok, _} <- UUID.cast(id),
         %Order{} = order <- Repo.get(Order, id) |> Repo.preload([:items, :user]) do
      {:ok, order}
    else
      :error -> {:error, Error.build(:bad_request, "Invalid ID")}
      nil -> {:error, Error.build(:not_found, "Order not found")}
    end
  end
end
