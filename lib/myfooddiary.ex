defmodule Myfooddiary do
  alias Myfooddiary.Meals.Create, as: MealCreate
  alias Myfooddiary.Meals.Get, as: MealGet
  alias Myfooddiary.Meals.Delete, as: MealDelete
  alias Myfooddiary.Meals.Update, as: MealUpdate

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate get_meal_by_id(id), to: MealGet, as: :by_id
  defdelegate get_meals, to: MealGet, as: :get_all
  defdelegate delete_meal(id), to: MealDelete, as: :call
  defdelegate update_meal(params), to: MealUpdate, as: :call
end
