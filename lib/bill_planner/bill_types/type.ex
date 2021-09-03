defmodule BillPlanner.BillTypes.Type do
  use Ecto.Schema
  import Ecto.Changeset

  schema "types" do
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(type, attrs) do
    type
    |> cast(attrs, [:type])
    |> validate_required([:type])
    |> unique_constraint(:type)
  end
end
