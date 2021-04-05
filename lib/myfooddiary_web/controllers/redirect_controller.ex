defmodule MyfooddiaryWeb.RedirectController do
  use MyfooddiaryWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> text("MyFoodDiary API - Use you prefered REST Client do send requests")
  end
end
