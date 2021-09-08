defmodule BillPlannerWeb.BillController do
  use BillPlannerWeb, :controller

  alias BillPlanner.Bills
  alias BillPlanner.Bills.Bill

  def index(conn, _params) do
    bills = Bills.list_bills()
    render(conn, "index.html", bills: bills)
  end

  def new(conn, _params) do
    changeset = Bills.change_bill(%Bill{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bill" => bill_params}) do
    case Bills.create_bill(bill_params) do
      {:ok, bill} ->
        conn
        |> put_flash(:info, "Bill created successfully.")
        |> redirect(to: Routes.bill_path(conn, :show, bill))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bill = Bills.get_bill!(id)
    render(conn, "show.html", bill: bill)
  end

  def edit(conn, %{"id" => id}) do
    bill = Bills.get_bill!(id)
    changeset = Bills.change_bill(bill)
    render(conn, "edit.html", bill: bill, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bill" => bill_params}) do
    bill = Bills.get_bill!(id)

    case Bills.update_bill(bill, bill_params) do
      {:ok, bill} ->
        conn
        |> put_flash(:info, "Bill updated successfully.")
        |> redirect(to: Routes.bill_path(conn, :show, bill))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", bill: bill, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bill = Bills.get_bill!(id)
    {:ok, _bill} = Bills.delete_bill(bill)

    conn
    |> put_flash(:info, "Bill deleted successfully.")
    |> redirect(to: Routes.bill_path(conn, :index))
  end
end
