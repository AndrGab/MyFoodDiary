defmodule MyfooddiaryWeb.MealsView do
  use MyfooddiaryWeb, :view

  alias Myfooddiary.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal Created!",
      meal: meal
    }
  end

  def render("meal.json", %{meal: %Meal{} = meal}), do: %{meal: meal}
  def render("meal.json", %{meal: [%Meal{} | _rest] = meal}), do: %{meal: meal}
end
