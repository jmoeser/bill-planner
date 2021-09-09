defmodule BillPlanner.BillsTest do
  use BillPlanner.DataCase

  alias BillPlanner.Bills

  describe "types" do
    alias BillPlanner.Bills.Type

    import BillPlanner.BillsFixtures

    @invalid_attrs %{type: nil}

    test "list_types/0 returns all types" do
      type = type_fixture()
      assert Bills.list_types() == [type]
    end

    test "get_type!/1 returns the type with given id" do
      type = type_fixture()
      assert Bills.get_type!(type.id) == type
    end

    test "create_type/1 with valid data creates a type" do
      valid_attrs = %{type: "some type"}

      assert {:ok, %Type{} = type} = Bills.create_type(valid_attrs)
      assert type.type == "some type"
    end

    test "create_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bills.create_type(@invalid_attrs)
    end

    test "update_type/2 with valid data updates the type" do
      type = type_fixture()
      update_attrs = %{type: "some updated type"}

      assert {:ok, %Type{} = type} = Bills.update_type(type, update_attrs)
      assert type.type == "some updated type"
    end

    test "update_type/2 with invalid data returns error changeset" do
      type = type_fixture()
      assert {:error, %Ecto.Changeset{}} = Bills.update_type(type, @invalid_attrs)
      assert type == Bills.get_type!(type.id)
    end

    test "delete_type/1 deletes the type" do
      type = type_fixture()
      assert {:ok, %Type{}} = Bills.delete_type(type)
      assert_raise Ecto.NoResultsError, fn -> Bills.get_type!(type.id) end
    end

    test "change_type/1 returns a type changeset" do
      type = type_fixture()
      assert %Ecto.Changeset{} = Bills.change_type(type)
    end
  end

  describe "providers" do
    alias BillPlanner.Bills.Provider

    import BillPlanner.BillsFixtures

    @invalid_attrs %{name: nil}

    test "list_providers/0 returns all providers" do
      provider = provider_fixture()
      assert Bills.list_providers() == [provider]
    end

    test "get_provider!/1 returns the provider with given id" do
      provider = provider_fixture()
      assert Bills.get_provider!(provider.id) == provider
    end

    test "create_provider/1 with valid data creates a provider" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Provider{} = provider} = Bills.create_provider(valid_attrs)
      assert provider.name == "some name"
    end

    test "create_provider/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bills.create_provider(@invalid_attrs)
    end

    test "update_provider/2 with valid data updates the provider" do
      provider = provider_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Provider{} = provider} = Bills.update_provider(provider, update_attrs)
      assert provider.name == "some updated name"
    end

    test "update_provider/2 with invalid data returns error changeset" do
      provider = provider_fixture()
      assert {:error, %Ecto.Changeset{}} = Bills.update_provider(provider, @invalid_attrs)
      assert provider == Bills.get_provider!(provider.id)
    end

    test "delete_provider/1 deletes the provider" do
      provider = provider_fixture()
      assert {:ok, %Provider{}} = Bills.delete_provider(provider)
      assert_raise Ecto.NoResultsError, fn -> Bills.get_provider!(provider.id) end
    end

    test "change_provider/1 returns a provider changeset" do
      provider = provider_fixture()
      assert %Ecto.Changeset{} = Bills.change_provider(provider)
    end
  end

  describe "bills" do
    alias BillPlanner.Bills.Bill

    import BillPlanner.BillsFixtures

    @invalid_attrs %{finish_date: nil, recurrence_in_days: nil, start_date: nil}

    test "list_bills/0 returns all bills" do
      bill = bill_fixture()
      assert Bills.list_bills() == [bill]
    end

    test "get_bill!/1 returns the bill with given id" do
      bill = bill_fixture()
      assert Bills.get_bill!(bill.id) == bill
    end

    test "create_bill/1 with valid data creates a bill" do
      valid_attrs = %{
        finish_date: ~D[2021-09-02],
        recurrence_in_days: 42,
        start_date: ~D[2021-09-02]
      }

      assert {:ok, %Bill{} = bill} = Bills.create_bill(valid_attrs)
      assert bill.finish_date == ~D[2021-09-02]
      assert bill.recurrence_in_days == 42
      assert bill.start_date == ~D[2021-09-02]
    end

    test "create_bill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bills.create_bill(@invalid_attrs)
    end

    test "update_bill/2 with valid data updates the bill" do
      bill = bill_fixture()

      update_attrs = %{
        finish_date: ~D[2021-09-03],
        recurrence_in_days: 43,
        start_date: ~D[2021-09-03]
      }

      assert {:ok, %Bill{} = bill} = Bills.update_bill(bill, update_attrs)
      assert bill.finish_date == ~D[2021-09-03]
      assert bill.recurrence_in_days == 43
      assert bill.start_date == ~D[2021-09-03]
    end

    test "update_bill/2 with invalid data returns error changeset" do
      bill = bill_fixture()
      assert {:error, %Ecto.Changeset{}} = Bills.update_bill(bill, @invalid_attrs)
      assert bill == Bills.get_bill!(bill.id)
    end

    test "delete_bill/1 deletes the bill" do
      bill = bill_fixture()
      assert {:ok, %Bill{}} = Bills.delete_bill(bill)
      assert_raise Ecto.NoResultsError, fn -> Bills.get_bill!(bill.id) end
    end

    test "change_bill/1 returns a bill changeset" do
      bill = bill_fixture()
      assert %Ecto.Changeset{} = Bills.change_bill(bill)
    end
  end

  describe "paid_bills" do
    alias BillPlanner.Bills.PaidBill
    alias BillPlanner.MoneyTypeConvert

    import BillPlanner.BillsFixtures

    @invalid_attrs %{amount: nil, paid_date: nil}

    test "list_paid_bills/0 returns all paid_bills" do
      paid_bill = paid_bill_fixture()

      assert Bills.list_paid_bills()
             |> Enum.map(fn item -> MoneyTypeConvert.set_price_from_cents(item, :amount) end) == [
               paid_bill
             ]
    end

    test "get_paid_bill!/1 returns the paid_bill with given id" do
      paid_bill = paid_bill_fixture()

      assert MoneyTypeConvert.convert_cents_to_dollars(
               Bills.get_paid_bill!(paid_bill.id),
               :amount,
               paid_bill.amount_in_cents
             ) == paid_bill
    end

    test "create_paid_bill/1 with valid data creates a paid_bill" do
      bill = bill_fixture()
      valid_attrs = %{bill_id: bill.id, amount: "42.03", paid_date: ~D[2021-09-02]}

      assert {:ok, %PaidBill{} = paid_bill} = Bills.create_paid_bill(valid_attrs)
      assert paid_bill.amount == "42.03"
      assert paid_bill.paid_date == ~D[2021-09-02]
      assert paid_bill.bill_id == bill.id
    end

    test "create_paid_bill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bills.create_paid_bill(@invalid_attrs)
    end

    test "update_paid_bill/2 with valid data updates the paid_bill" do
      paid_bill = paid_bill_fixture()
      update_attrs = %{amount: "43.33", paid_date: ~D[2021-09-03]}

      assert {:ok, %PaidBill{} = paid_bill} = Bills.update_paid_bill(paid_bill, update_attrs)
      assert paid_bill.amount == "43.33"
      assert paid_bill.paid_date == ~D[2021-09-03]
    end

    test "update_paid_bill/2 with invalid data returns error changeset" do
      paid_bill = paid_bill_fixture()
      assert {:error, %Ecto.Changeset{}} = Bills.update_paid_bill(paid_bill, @invalid_attrs)

      assert paid_bill ==
               MoneyTypeConvert.convert_cents_to_dollars(
                 Bills.get_paid_bill!(paid_bill.id),
                 :amount,
                 paid_bill.amount_in_cents
               )
    end

    test "delete_paid_bill/1 deletes the paid_bill" do
      paid_bill = paid_bill_fixture()
      assert {:ok, %PaidBill{}} = Bills.delete_paid_bill(paid_bill)
      assert_raise Ecto.NoResultsError, fn -> Bills.get_paid_bill!(paid_bill.id) end
    end

    test "change_paid_bill/1 returns a paid_bill changeset" do
      paid_bill = paid_bill_fixture()
      assert %Ecto.Changeset{} = Bills.change_paid_bill(paid_bill)
    end
  end
end
