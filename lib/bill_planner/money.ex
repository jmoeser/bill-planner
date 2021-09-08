defmodule BillPlanner.MoneyTypeConvert do
  @moduledoc """
  Module which converts our string based dollars and cents to integers
  and populating the value into _in_cents fields.
  """

  import Ecto.Changeset

  def convert_to_cents(value) when is_binary(value) do
    case Money.parse(value) do
      {:ok, %Money{amount: amount}} -> amount
      :error -> value
    end
  end

  def convert_field_name_to_cents(field) do
    String.to_existing_atom("#{field}_in_cents")
  end

  def set_price_in_cents(changeset, field) do
    case changeset do
      %Ecto.Changeset{changes: %{^field => value}} ->
        put_change(changeset, convert_field_name_to_cents(field), convert_to_cents(value))

      _ ->
        changeset
    end
  end

  def convert_cents_to_dollars(item, _field, nil), do: item

  def convert_cents_to_dollars(item, field, value) do
    Map.put(
      item,
      field,
      Money.to_string(Money.new(value), symbol: false)
    )
  end

  def convert_cents_to_dollars(item) do
    Money.to_string(Money.new(item), symbol: false)
  end
end
