defmodule BillPlannerWeb.PaidBillController do
  use BillPlannerWeb, :controller

  alias BillPlanner.Bills
  alias BillPlanner.Bills.PaidBill

  def index(conn, _params) do
    paidbills = Bills.list_paid_bills()
    render(conn, "index.html", paidbills: paidbills)
  end

  def new(conn, _params) do
    changeset = Bills.change_paid_bill(%PaidBill{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"paid_bill" => paid_bill_params}) do
    case Bills.create_paid_bill(paid_bill_params) do
      {:ok, paid_bill} ->
        conn
        |> put_flash(:info, "Paid bill created successfully.")
        |> redirect(to: Routes.paid_bill_path(conn, :show, paid_bill))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    paid_bill = Bills.get_paid_bill!(id)
    render(conn, "show.html", paid_bill: paid_bill)
  end

  def edit(conn, %{"id" => id}) do
    paid_bill = Bills.get_paid_bill!(id)
    changeset = Bills.change_paid_bill(paid_bill)
    render(conn, "edit.html", paid_bill: paid_bill, changeset: changeset)
  end

  def update(conn, %{"id" => id, "paid_bill" => paid_bill_params}) do
    paid_bill = Bills.get_paid_bill!(id)

    case Bills.update_paid_bill(paid_bill, paid_bill_params) do
      {:ok, paid_bill} ->
        conn
        |> put_flash(:info, "Paid bill updated successfully.")
        |> redirect(to: Routes.paid_bill_path(conn, :show, paid_bill))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", paid_bill: paid_bill, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    paid_bill = Bills.get_paid_bill!(id)
    {:ok, _paid_bill} = Bills.delete_paid_bill(paid_bill)

    conn
    |> put_flash(:info, "Paid bill deleted successfully.")
    |> redirect(to: Routes.paid_bill_path(conn, :index))
  end
end
