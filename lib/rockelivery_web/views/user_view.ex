defmodule RockeliveryWeb.UserView do
  use RockeliveryWeb, :view

  alias Rockelivery.Users.User

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "User created!",
      token: token,
      user: user
    }
  end

  def render("sign_in.json", %{token: token}) do
    %{
      token: token
    }
  end

  def render("show.json", %{user: %User{} = user}) do
    %{
      message: "User found!",
      user: user
    }
  end

  def render("delete.json", %{user: %User{} = user}) do
    %{
      message: "User deleted!",
      user: user
    }
  end

  def render("update.json", %{user: %User{} = user}) do
    %{
      message: "User updated!",
      user: user
    }
  end
end
