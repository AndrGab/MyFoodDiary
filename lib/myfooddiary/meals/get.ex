defmodule Myfooddiary.Meals.Get do
  alias Myfooddiary.{Error, Repo, Meal}

  import Ecto.Query

  def by_user(id) do
    query = from meal in Meal, where: meal.user_id == ^id

    case Repo.all(query) do
      [] -> {:error, Error.build_meal_not_found_error()}
      meal -> {:ok, meal}
    end
  end

  def by_id(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> {:ok, meal}
    end
  end

  def get_all() do
    case Repo.all(Meal) do
      [] -> {:error, Error.build(:not_found, "Empty database")}
      meal -> {:ok, meal}
    end
  end
end
