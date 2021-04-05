defmodule MyfooddiaryWeb.MealsController do
  use MyfooddiaryWeb, :controller

  alias Myfooddiary.Meal
  alias MyfooddiaryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Myfooddiary.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- Myfooddiary.get_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Meal{}} <- Myfooddiary.delete_meal(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def update(conn, params) do
    with {:ok, %Meal{} = meal} <- Myfooddiary.update_meal(params) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end

  def index(conn, _params) do
    with {:ok, meal} <- Myfooddiary.get_meals() do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end
end
