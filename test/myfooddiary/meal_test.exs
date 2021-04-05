defmodule Myfooddiary.MealTest do
  use Myfooddiary.DataCase, async: true

  import Myfooddiary.Factory

  alias Myfooddiary.Meal
  alias Ecto.Changeset

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:meal_params)

      response = Meal.changeset(params)

      assert %Changeset{changes: %{descricao: "Arroz Branco porção 100g"}, valid?: true} =
               response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = build(:meal_params)

      update_params = %{descricao: "Arroz Branco"}

      response =
        params
        |> Meal.changeset()
        |> Meal.changeset(update_params)

      assert %Changeset{changes: %{descricao: "Arroz Branco"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = build(:meal_params, %{calorias: -150, data: "2021-13-01 12:00:00"})

      response = Meal.changeset(params)

      expected_response = %{
        calorias: ["must be greater than or equal to 0"],
        data: ["is invalid"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
