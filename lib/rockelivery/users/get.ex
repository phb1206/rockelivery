defmodule Rockelivery.Users.Get do
  alias Ecto.UUID
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.Users.User

  def by_id(id) do
    with {:ok, _} <- UUID.cast(id),
         %User{} = user <- Repo.get(User, id) do
      {:ok, user}
    else
      :error -> {:error, Error.build(:bad_request, "Invalid ID")}
      nil -> {:error, Error.build(:not_found, "User not found")}
    end
  end
end
