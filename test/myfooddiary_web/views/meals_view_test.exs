defmodule MyfooddiaryWeb.MealsViewTest do
  use MyfooddiaryWeb.ConnCase, async: true

  import Phoenix.View
  import Myfooddiary.Factory

  alias MyfooddiaryWeb.MealsView

  test "renders create.json" do
    meal = build(:meal)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             message: "Meal Created!",
             meal: %Myfooddiary.Meal{
               descricao: "Arroz Branco porção 100g",
               calorias: 200,
               data: "2021-04-01 12:00:00",
               id: "22d9e500-bacb-4e30-997a-239e5c2bb6b8",
               inserted_at: nil,
               updated_at: nil
             }
           } == response
  end

  test "renders meal.json" do
    meal = build(:meal)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %Myfooddiary.Meal{
               descricao: "Arroz Branco porção 100g",
               calorias: 200,
               data: "2021-04-01 12:00:00",
               id: "22d9e500-bacb-4e30-997a-239e5c2bb6b8",
               inserted_at: nil,
               updated_at: nil
             }
           } == response
  end

  test "renders meal.json list" do
    meal = build(:meal)

    response = render(MealsView, "meal.json", meal: [meal])

    assert %{
             meal: [
               %Myfooddiary.Meal{
                 descricao: "Arroz Branco porção 100g",
                 calorias: 200,
                 data: "2021-04-01 12:00:00",
                 id: "22d9e500-bacb-4e30-997a-239e5c2bb6b8",
                 inserted_at: nil,
                 updated_at: nil
               }
             ]
           } == response
  end
end
