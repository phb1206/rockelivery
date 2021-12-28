defmodule Rockelivery.Repo.Migrations.CreateOrdersItemsTable do
  use Ecto.Migration

  def change do
    create table(:order_item, primary_key: false) do
      add :order_id, references(:order, type: :binary)
      add :item_id, references(:item, type: :binary)
    end
  end
end
