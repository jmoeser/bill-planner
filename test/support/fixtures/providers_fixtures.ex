defmodule BillPlanner.ProvidersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BillPlanner.Providers` context.
  """

  @doc """
  Generate a provider.
  """
  def provider_fixture(attrs \\ %{}) do
    {:ok, provider} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> BillPlanner.Providers.create_provider()

    provider
  end
end
