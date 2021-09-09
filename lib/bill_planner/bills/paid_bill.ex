defmodule BillPlanner.Bills.PaidBill do
  use Ecto.Schema
  import Ecto.Changeset

  alias BillPlanner.MoneyTypeConvert

  schema "paid_bills" do
    belongs_to(:bill, BillPlanner.Bills.Bill)
    field :amount, :string, virtual: true
    field :amount_in_cents, :integer
    field :paid_date, :date

    timestamps()
  end

  @doc false
  def changeset(paid_bill, attrs) do
    paid_bill
    |> cast(attrs, [:bill_id, :amount, :paid_date])
    |> validate_required([:bill_id, :amount, :paid_date])
    |> MoneyTypeConvert.set_price_in_cents(:amount)
    |> validate_required([:amount_in_cents])
    |> validate_number(:amount_in_cents, greater_than: 0)
  end
end
