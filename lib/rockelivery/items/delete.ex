defmodule Rockelivery.Items.Delete do
  alias Ecto.UUID
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.Items.Item

  def call(id) do
    with {:ok, _} <- UUID.cast(id),
         %Item{} = item <- Repo.get(Item, id) do
      Repo.delete(item)
    else
      :error -> {:error, Error.build(:bad_request, "Invalid ID")}
      nil -> {:error, Error.build(:not_found, "Item not found")}
    end
  end
end
