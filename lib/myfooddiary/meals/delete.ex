defmodule Myfooddiary.Meals.Delete do
  alias Myfooddiary.{Error, Repo, Meal}

  def call(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> Repo.delete(meal)
    end
  end
end
