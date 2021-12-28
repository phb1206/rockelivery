defmodule Rockelivery.Users.Update do
  alias Ecto.UUID
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.Users.User

  def call(%{"id" => id} = params) do
    with {:ok, _} <- UUID.cast(id),
         %User{} = user <- Repo.get(User, id) do
      user
      |> User.changeset(params)
      |> Repo.update()
    else
      :error -> {:error, Error.build(:bad_request, "Invalid ID")}
      nil -> {:error, Error.build(:not_found, "User not found")}
    end
  end
end
