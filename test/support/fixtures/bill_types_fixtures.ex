defmodule BillPlanner.BillTypesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BillPlanner.BillTypes` context.
  """

  @doc """
  Generate a type.
  """
  def type_fixture(attrs \\ %{}) do
    {:ok, type} =
      attrs
      |> Enum.into(%{
        type: "some type"
      })
      |> BillPlanner.BillTypes.create_type()

    type
  end
end
