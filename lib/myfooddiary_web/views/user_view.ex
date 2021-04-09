defmodule MyfooddiaryWeb.UsersView do
  use MyfooddiaryWeb, :view

  alias Myfooddiary.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User Created!",
      user: user
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: user}
  def render("user.json", %{user: [%User{} | _rest] = user}), do: %{user: user}
end
