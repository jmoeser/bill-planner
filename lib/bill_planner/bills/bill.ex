defmodule BillPlanner.Bills.Bill do
  use Ecto.Schema
  import Ecto.Changeset

  alias BillPlanner.Bills.{Type, Provider}

  # @schema_prefix "bill_planner"
  # https://hexdocs.pm/ecto/multi-tenancy-with-query-prefixes.html#content
  schema "bills" do
    belongs_to(:type, Type)
    belongs_to(:provider, Provider)
    field :finish_date, :date
    field :recurrence_in_days, :integer
    field :start_date, :date

    timestamps()
  end

  @doc false
  def changeset(bill, attrs) do
    bill
    |> cast(attrs, [:type_id, :provider_id, :start_date, :recurrence_in_days, :finish_date])
    |> validate_required([:type_id, :provider_id, :start_date, :recurrence_in_days, :finish_date])
  end
end
