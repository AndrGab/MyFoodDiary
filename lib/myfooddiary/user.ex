defmodule Myfooddiary.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Myfooddiary.Meal

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:cpf, :email, :name]
  @update_params [:cpf, :email, :name]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "users" do
    field :cpf, :string
    field :email, :string
    field :name, :string

    has_many :meal, Meal

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> changes(params, @required_params)
  end

  def changeset(struct, params) do
    struct
    |> changes(params, @update_params)
  end

  defp changes(struct, params, fields) do
    struct
    |> cast(params, fields)
    |> validate_required(fields)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
  end
end
