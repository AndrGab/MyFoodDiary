defmodule Myfooddiary.Users.Get do
  alias Myfooddiary.{Error, Repo, User}

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end

  def get_all() do
    case Repo.all(User) do
      [] -> {:error, Error.build(:not_found, "Empty database")}
      meal -> {:ok, meal}
    end
  end
end
