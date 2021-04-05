defmodule MyfooddiaryWeb.FallbackController do
  use MyfooddiaryWeb, :controller

  alias Myfooddiary.Error
  alias MyfooddiaryWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", %{result: result})
  end
end
