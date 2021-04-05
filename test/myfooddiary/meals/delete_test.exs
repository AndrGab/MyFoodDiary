defmodule Myfooddiary.Meals.DeleteTest do
  use Myfooddiary.DataCase, async: true

  alias Myfooddiary.{Error, Meal}
  alias Myfooddiary.Meals.{Delete, Create}

  import Myfooddiary.Factory

  describe "call/1" do
    test "when id is valid, deleltes the meal" do
      params = build(:meal_params)

      {:ok,
       %Meal{
         id: id,
         descricao: _descricao,
         calorias: _calorias,
         data: _data
       }} = Create.call(params)

      response = Delete.call(id)

      assert {:ok,
              %Meal{
                calorias: 200,
                data: ~N[2021-04-01 12:00:00],
                descricao: "Arroz Branco porção 100g",
                id: _id,
                inserted_at: _inserted,
                updated_at: _updated
              }} = response
    end

    test "when an inexistent id is sent, returns an error" do
      response = Delete.call("22d9e500-bacb-4e30-997a-239e5c2bb6b8")

      expected_response = {:error, Error.build_meal_not_found_error()}
      assert response == expected_response
    end
  end
end
