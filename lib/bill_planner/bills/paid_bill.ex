defmodule BillPlanner.Bills.PaidBill do
  use Ecto.Schema
  import Ecto.Changeset

  alias BillPlanner.MoneyTypeConvert

  schema "paid_bills" do
    field :amount, :string, virtual: true
    field :amount_in_cents, :integer
    field :paid_date, :date
    field :bill_id, :id

    timestamps()
  end

  @doc false
  def changeset(paid_bill, attrs) do
    paid_bill
    |> cast(attrs, [:amount, :paid_date])
    |> validate_required([:amount, :paid_date])
    |> MoneyTypeConvert.set_price_in_cents(:amount)
    |> validate_required([:amount_in_cents])
    |> validate_number(:amount_in_cents, greater_than: 0)
  end
end
    # belongs_to(:security, Security)
