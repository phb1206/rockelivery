defmodule Rockelivery.Repo.Migrations.CreateOrdersTable do
  use Ecto.Migration

  def change do
    create table(:order) do
      add :address, :string
      add :comments, :string
      add :payment_method, :payment_method
      add :user_id, references(:user, type: :binary)

      timestamps()
    end
  end
end
