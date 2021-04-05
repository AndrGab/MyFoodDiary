defmodule Myfooddiary.Repo do
  use Ecto.Repo,
    otp_app: :myfooddiary,
    adapter: Ecto.Adapters.Postgres
end
