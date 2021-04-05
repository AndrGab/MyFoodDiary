defmodule MyfooddiaryWeb.MealsControllerTest do
  use MyfooddiaryWeb.ConnCase, async: true

  import Myfooddiary.Factory

  describe "create/2" do
    test "when all params are valid, creates the meal", %{conn: conn} do
      params = %{
        "descricao" => "Feijão Preto porção 25g",
        "calorias" => 55,
        "data" => "2021-03-15 15:00:00"
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Meal Created!",
               "meal" => %{
                 "descricao" => "Feijão Preto porção 25g",
                 "calorias" => 55,
                 "data" => "2021-03-15T15:00:00",
                 "id" => _id
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "descricao" => "Barra de Chocolate 25g"
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{"calorias" => ["can't be blank"], "data" => ["can't be blank"]}
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is an user with the given id, deletes the user", %{conn: conn} do
      id = "22d9e500-bacb-4e30-997a-239e5c2bb6b8"
      insert(:meal)

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
