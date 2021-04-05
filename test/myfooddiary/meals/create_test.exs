defmodule Myfooddiary.Meals.CreateTest do
  use Myfooddiary.DataCase, async: true

  alias Myfooddiary.{Error, Meal}
  alias Myfooddiary.Meals.Create

  import Myfooddiary.Factory

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      params = build(:meal_params)
      response = Create.call(params)

      assert {:ok,
              %Meal{
                id: _id,
                descricao: "Arroz Branco porção 100g",
                calorias: 200,
                data: ~N[2021-04-01 12:00:00]
              }} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:meal_params, %{data: "2021-02-31 12:00:00", calorias: -200})
      response = Create.call(params)

      expected_response = %{
        calorias: ["must be greater than or equal to 0"],
        data: ["is invalid"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
