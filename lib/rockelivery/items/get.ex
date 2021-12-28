defmodule Rockelivery.Items.Get do
  alias Ecto.UUID
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.Items.Item

  def by_id(id) do
    with {:ok, _} <- UUID.cast(id),
         %Item{} = item <- Repo.get(Item, id) do
      {:ok, item}
    else
      :error -> {:error, Error.build(:bad_request, "Invalid ID")}
      nil -> {:error, Error.build(:not_found, "Item not found")}
    end
  end
end
