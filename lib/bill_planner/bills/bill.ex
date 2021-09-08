defmodule BillPlanner.Bills.Bill do
  use Ecto.Schema
  import Ecto.Changeset

  # @schema_prefix "bill_planner"
  # https://hexdocs.pm/ecto/multi-tenancy-with-query-prefixes.html#content
  schema "bills" do
    field :finish_date, :date
    field :recurrence_in_days, :integer
    field :start_date, :date
    field :type_id, :id
    field :company_id, :id

    timestamps()
  end

  @doc false
  def changeset(bill, attrs) do
    bill
    |> cast(attrs, [:start_date, :recurrence_in_days, :finish_date])
    |> validate_required([:start_date, :recurrence_in_days, :finish_date])
  end
end
