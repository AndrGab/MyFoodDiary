defmodule MyfooddiaryWeb.UsersController do
  use MyfooddiaryWeb, :controller

  alias Myfooddiary.User
  alias MyfooddiaryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Myfooddiary.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Myfooddiary.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Myfooddiary.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Myfooddiary.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> text("MyFoodDiary API - Use you prefered REST Client do send requests")
  end
end
