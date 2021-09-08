defmodule BillPlanner.BillsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BillPlanner.Bills` context.
  """

  @doc """
  Generate a unique type type.
  """
  def unique_type_type, do: "some type#{System.unique_integer([:positive])}"

  @doc """
  Generate a type.
  """
  def type_fixture(attrs \\ %{}) do
    {:ok, type} =
      attrs
      |> Enum.into(%{
        type: unique_type_type()
      })
      |> BillPlanner.Bills.create_type()

    type
  end

  @doc """
  Generate a unique provider name.
  """
  def unique_provider_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a provider.
  """
  def provider_fixture(attrs \\ %{}) do
    {:ok, provider} =
      attrs
      |> Enum.into(%{
        name: unique_provider_name()
      })
      |> BillPlanner.Bills.create_provider()

    provider
  end

  @doc """
  Generate a bill.
  """
  def bill_fixture(attrs \\ %{}) do
    {:ok, bill} =
      attrs
      |> Enum.into(%{
        finish_date: ~D[2021-09-02],
        recurrence_in_days: 42,
        start_date: ~D[2021-09-02]
      })
      |> BillPlanner.Bills.create_bill()

    bill
  end

  @doc """
  Generate a paid_bill.
  """
  def paid_bill_fixture(attrs \\ %{}) do
    {:ok, paid_bill} =
      attrs
      |> Enum.into(%{
        amount: "42.03",
        paid_date: ~D[2021-09-02]
      })
      |> BillPlanner.Bills.create_paid_bill()

    paid_bill
  end
end
