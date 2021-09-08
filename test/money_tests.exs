defmodule BillPlannerMoneyTypeConvertTest do
  use ExUnit.Case

  import Ecto.Changeset

  alias BillPlanner.MoneyTypeConvert
  alias BillPlanner.Bills.PaidBill

  describe "convert_to_cents/1" do
    test "ensure string is converted to int" do
      assert 5305 = MoneyTypeConvert.convert_to_cents("53.05")
    end

    test "returns original string when not given a money-like value" do
      assert "asd" = MoneyTypeConvert.convert_to_cents("asd")
    end
  end

  describe "convert_field_name_to_cents/1" do
    test "ensure field name is appended with _in_cents and converted to atom" do
      # field_name = BuyHigh.Money.convert_field_name_to_cents("test")
      assert :test_in_cents = MoneyTypeConvert.convert_field_name_to_cents("test")
    end
  end

  describe "convert_cents_to_dollars/3" do
    test "ensure cents are converted to a dollars and cents string" do
      assert %{test: "53.05"} = MoneyTypeConvert.convert_cents_to_dollars(%{}, :test, 5305)
    end

    test "ensure nil values are ignored" do
      assert %{test: "test"} =
               MoneyTypeConvert.convert_cents_to_dollars(%{test: "test"}, :price, nil)
    end
  end

  describe "set_price_in_cents/2" do
    test "ensure dollar string is converted to int in changeset" do
        paid_bill = %{amount: "53.03", date: Date.utc_today(),}
        changeset = cast(%PaidBill{}, paid_bill, [:amount, :date])
      #security = %{symbol: "VDHG", name: "Vanguard", price: "53.03"}
      #changeset = cast(%Security{}, security, [:name, :symbol, :security_type_id, :price])

      assert %{amount_in_cents: value} =
               MoneyTypeConvert.set_price_in_cents(changeset, :amount).changes

      assert 5303 = value
    end

  end
end
