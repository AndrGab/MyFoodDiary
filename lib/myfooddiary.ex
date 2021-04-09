defmodule Myfooddiary do
  alias Myfooddiary.Meals.Create, as: MealCreate
  alias Myfooddiary.Meals.Get, as: MealGet
  alias Myfooddiary.Meals.Delete, as: MealDelete
  alias Myfooddiary.Meals.Update, as: MealUpdate

  alias Myfooddiary.Users.Create, as: UserCreate
  alias Myfooddiary.Users.Get, as: UserGet
  alias Myfooddiary.Users.Delete, as: UserDelete
  alias Myfooddiary.Users.Update, as: UserUpdate

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate get_meal_by_id(id), to: MealGet, as: :by_id
  defdelegate get_meals, to: MealGet, as: :get_all
  defdelegate delete_meal(id), to: MealDelete, as: :call
  defdelegate update_meal(params), to: MealUpdate, as: :call

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate update_user(params), to: UserUpdate, as: :call
end
