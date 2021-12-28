defmodule RockeliveryWeb.UserController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Users.{Create, Delete, Get, Update, User}
  alias RockeliveryWeb.Auth.Guardian

  action_fallback RockeliveryWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Create.call(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("create.json", token: token, user: user)
    end
  end

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end

  def show(conn, params) do
    with {:ok, %User{} = user} <- Get.by_id(params["id"]) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    end
  end

  def delete(conn, params) do
    with {:ok, %User{}} <- Delete.call(params["id"]) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Update.call(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", user: user)
    end
  end
end
