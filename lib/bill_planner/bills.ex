defmodule BillPlanner.Bills do
  @moduledoc """
  The Bills context.
  """

  import Ecto.Query, warn: false
  alias BillPlanner.Repo

  alias BillPlanner.Bills.Type

  @doc """
  Returns the list of types.

  ## Examples

      iex> list_types()
      [%Type{}, ...]

  """
  def list_types do
    Repo.all(Type)
  end

  @doc """
  Gets a single type.

  Raises `Ecto.NoResultsError` if the Type does not exist.

  ## Examples

      iex> get_type!(123)
      %Type{}

      iex> get_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_type!(id), do: Repo.get!(Type, id)

  @doc """
  Creates a type.

  ## Examples

      iex> create_type(%{field: value})
      {:ok, %Type{}}

      iex> create_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_type(attrs \\ %{}) do
    %Type{}
    |> Type.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a type.

  ## Examples

      iex> update_type(type, %{field: new_value})
      {:ok, %Type{}}

      iex> update_type(type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_type(%Type{} = type, attrs) do
    type
    |> Type.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a type.

  ## Examples

      iex> delete_type(type)
      {:ok, %Type{}}

      iex> delete_type(type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_type(%Type{} = type) do
    Repo.delete(type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking type changes.

  ## Examples

      iex> change_type(type)
      %Ecto.Changeset{data: %Type{}}

  """
  def change_type(%Type{} = type, attrs \\ %{}) do
    Type.changeset(type, attrs)
  end

  alias BillPlanner.Bills.Provider

  @doc """
  Returns the list of providers.

  ## Examples

      iex> list_providers()
      [%Provider{}, ...]

  """
  def list_providers do
    Repo.all(Provider)
  end

  @doc """
  Gets a single provider.

  Raises `Ecto.NoResultsError` if the Provider does not exist.

  ## Examples

      iex> get_provider!(123)
      %Provider{}

      iex> get_provider!(456)
      ** (Ecto.NoResultsError)

  """
  def get_provider!(id), do: Repo.get!(Provider, id)

  @doc """
  Creates a provider.

  ## Examples

      iex> create_provider(%{field: value})
      {:ok, %Provider{}}

      iex> create_provider(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_provider(attrs \\ %{}) do
    %Provider{}
    |> Provider.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a provider.

  ## Examples

      iex> update_provider(provider, %{field: new_value})
      {:ok, %Provider{}}

      iex> update_provider(provider, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_provider(%Provider{} = provider, attrs) do
    provider
    |> Provider.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a provider.

  ## Examples

      iex> delete_provider(provider)
      {:ok, %Provider{}}

      iex> delete_provider(provider)
      {:error, %Ecto.Changeset{}}

  """
  def delete_provider(%Provider{} = provider) do
    Repo.delete(provider)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking provider changes.

  ## Examples

      iex> change_provider(provider)
      %Ecto.Changeset{data: %Provider{}}

  """
  def change_provider(%Provider{} = provider, attrs \\ %{}) do
    Provider.changeset(provider, attrs)
  end

  alias BillPlanner.Bills.Bill

  @doc """
  Returns the list of bills.

  ## Examples

      iex> list_bills()
      [%Bill{}, ...]

  """
  def list_bills do
    Repo.all(Bill)
  end

  @doc """
  Gets a single bill.

  Raises `Ecto.NoResultsError` if the Bill does not exist.

  ## Examples

      iex> get_bill!(123)
      %Bill{}

      iex> get_bill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bill!(id), do: Repo.get!(Bill, id)

  @doc """
  Creates a bill.

  ## Examples

      iex> create_bill(%{field: value})
      {:ok, %Bill{}}

      iex> create_bill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bill(attrs \\ %{}) do
    %Bill{}
    |> Bill.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bill.

  ## Examples

      iex> update_bill(bill, %{field: new_value})
      {:ok, %Bill{}}

      iex> update_bill(bill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bill(%Bill{} = bill, attrs) do
    bill
    |> Bill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bill.

  ## Examples

      iex> delete_bill(bill)
      {:ok, %Bill{}}

      iex> delete_bill(bill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bill(%Bill{} = bill) do
    Repo.delete(bill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bill changes.

  ## Examples

      iex> change_bill(bill)
      %Ecto.Changeset{data: %Bill{}}

  """
  def change_bill(%Bill{} = bill, attrs \\ %{}) do
    Bill.changeset(bill, attrs)
  end

  alias BillPlanner.Bills.PaidBill

  @doc """
  Returns the list of paidbills.

  ## Examples

      iex> list_paidbills()
      [%PaidBill{}, ...]

  """
  def list_paidbills do
    Repo.all(PaidBill)
  end

  @doc """
  Gets a single paid_bill.

  Raises `Ecto.NoResultsError` if the Paid bill does not exist.

  ## Examples

      iex> get_paid_bill!(123)
      %PaidBill{}

      iex> get_paid_bill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_paid_bill!(id), do: Repo.get!(PaidBill, id)

  @doc """
  Creates a paid_bill.

  ## Examples

      iex> create_paid_bill(%{field: value})
      {:ok, %PaidBill{}}

      iex> create_paid_bill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_paid_bill(attrs \\ %{}) do
    %PaidBill{}
    |> PaidBill.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a paid_bill.

  ## Examples

      iex> update_paid_bill(paid_bill, %{field: new_value})
      {:ok, %PaidBill{}}

      iex> update_paid_bill(paid_bill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_paid_bill(%PaidBill{} = paid_bill, attrs) do
    paid_bill
    |> PaidBill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a paid_bill.

  ## Examples

      iex> delete_paid_bill(paid_bill)
      {:ok, %PaidBill{}}

      iex> delete_paid_bill(paid_bill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_paid_bill(%PaidBill{} = paid_bill) do
    Repo.delete(paid_bill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking paid_bill changes.

  ## Examples

      iex> change_paid_bill(paid_bill)
      %Ecto.Changeset{data: %PaidBill{}}

  """
  def change_paid_bill(%PaidBill{} = paid_bill, attrs \\ %{}) do
    PaidBill.changeset(paid_bill, attrs)
  end
end
