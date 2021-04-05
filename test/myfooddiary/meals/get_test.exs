defmodule Myfooddiary.Meals.GetTest do
  use Myfooddiary.DataCase, async: true

  alias Myfooddiary.{Error, Meal}
  alias Myfooddiary.Meals.{Get, Create}

  import Myfooddiary.Factory

  describe "by_id/1" do
    test "when id is valid, returns the meal" do
      params = build(:meal_params)

      {:ok,
       %Meal{
         id: id,
         descricao: _descricao,
         calorias: _calorias,
         data: _data
       }} = Create.call(params)

      response = Get.by_id(id)

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
      response = Get.by_id("22d9e500-bacb-4e30-997a-239e5c2bb6b8")

      expected_response = {:error, Error.build_meal_not_found_error()}
      assert response == expected_response
    end
  end

  describe "get_all/0" do
    test "get all meal from database" do
      params = build(:meal_params)
      Create.call(params)

      response = Get.get_all()

      assert {:ok,
              [
                %Meal{
                  calorias: 200,
                  data: ~N[2021-04-01 12:00:00],
                  descricao: "Arroz Branco porção 100g",
                  id: _id,
                  inserted_at: _inserted,
                  updated_at: _updated
                }
              ]} = response
    end

    test "Returns error when database is empty" do
      response = Get.get_all()

      expected_response = {:error, Error.build(:not_found, "Empty database")}
      assert response == expected_response
    end
  end
end
