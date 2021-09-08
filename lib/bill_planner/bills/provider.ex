defmodule BillPlanner.Bills.Provider do
  use Ecto.Schema
  import Ecto.Changeset

  schema "providers" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(provider, attrs) do
    provider
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
