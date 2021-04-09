defmodule Myfooddiary.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.{UUID, Changeset}
  alias Myfooddiary.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:descricao, :data, :calorias, :user_id]

  @derive {Jason.Encoder, only: [:id, :descricao, :data, :calorias, :user_id]}

  schema "meals" do
    field :descricao, :string
    field :data, :naive_datetime
    field :calorias, :integer
    belongs_to :user, User

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> changes(params, @required_params)
  end

  def changeset(struct, params) do
    struct
    |> changes(params, @required_params)
  end

  defp changes(struct, params, fields) do
    struct
    |> cast(params, fields)
    |> validate_required(fields)
    |> validate_number(:calorias, greater_than: 0)
    |> foreign_key_constraint(:user_id)
    |> validate_uuid()
  end

  defp validate_uuid(%Changeset{valid?: true, changes: %{user_id: id}} = changeset) do
    case UUID.cast(id) do
      :error -> add_error(changeset, :user_id, "Invalid UUID")
      _ -> changeset
    end
  end

  defp validate_uuid(changeset), do: changeset
end
