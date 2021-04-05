defmodule Myfooddiary.Meals.Get do
  alias Myfooddiary.{Error, Repo, Meal}

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
