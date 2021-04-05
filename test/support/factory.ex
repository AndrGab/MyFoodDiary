defmodule Myfooddiary.Factory do
  use ExMachina.Ecto, repo: Myfooddiary.Repo

  alias Myfooddiary.Meal

  def meal_params_factory do
    %{
      data: "2021-04-01 12:00:00",
      descricao: "Arroz Branco porção 100g",
      calorias: 200
    }
  end

  def meal_factory do
    %Meal{
      id: "22d9e500-bacb-4e30-997a-239e5c2bb6b8",
      data: "2021-04-01 12:00:00",
      descricao: "Arroz Branco porção 100g",
      calorias: 200
    }
  end
end
