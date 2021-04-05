defmodule Myfooddiary.Meals.UpdateTest do
  use Myfooddiary.DataCase, async: true

  alias Myfooddiary.{Error, Meal}
  alias Myfooddiary.Meals.{Create, Update}

  import Myfooddiary.Factory

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      params = build(:meal_params)

      {:ok,
       %Meal{
         id: id,
         descricao: _descricao,
         calorias: _calorias,
         data: _data
       }} = Create.call(params)

      update_params = %{"id" => id, "descricao" => "updated"}

      response = Update.call(update_params)

      assert {:ok,
              %Meal{
                calorias: 200,
                data: ~N[2021-04-01 12:00:00],
                descricao: "updated",
                id: _id,
                inserted_at: _inserted,
                updated_at: _updated
              }} = response
    end

    test "when an inexistent id is sent, returns an error" do
      response =
        Update.call(%{"id" => "edb1adc4-7603-4f75-89c2-a1e7900392fd", "descricao" => "updated"})

      expected_response = {:error, Error.build_meal_not_found_error()}
      assert response == expected_response
    end
  end
end
