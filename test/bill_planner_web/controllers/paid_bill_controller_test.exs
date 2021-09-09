defmodule BillPlannerWeb.PaidBillControllerTest do
  use BillPlannerWeb.ConnCase

  import BillPlanner.BillsFixtures

  @create_attrs %{amount: "42.07", paid_date: ~D[2021-09-02]}
  @update_attrs %{amount: "43.33", paid_date: ~D[2021-09-03]}
  @invalid_attrs %{bill_id: nil, amount_in_cents: nil, paid_date: nil}

  describe "index" do
    test "lists all paidbills", %{conn: conn} do
      conn = get(conn, Routes.paid_bill_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Paidbills"
    end
  end

  describe "new paid_bill" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.paid_bill_path(conn, :new))
      assert html_response(conn, 200) =~ "New Paid bill"
    end
  end

  describe "create paid_bill" do
    test "redirects to show when data is valid", %{conn: conn} do
      bill = bill_fixture()

      conn =
        post(conn, Routes.paid_bill_path(conn, :create),
          paid_bill: Map.put(@create_attrs, :bill_id, bill.id)
        )

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.paid_bill_path(conn, :show, id)

      conn = get(conn, Routes.paid_bill_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Paid bill"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.paid_bill_path(conn, :create), paid_bill: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Paid bill"
    end
  end

  describe "edit paid_bill" do
    setup [:create_paid_bill]

    test "renders form for editing chosen paid_bill", %{conn: conn, paid_bill: paid_bill} do
      conn = get(conn, Routes.paid_bill_path(conn, :edit, paid_bill))
      assert html_response(conn, 200) =~ "Edit Paid bill"
    end
  end

  describe "update paid_bill" do
    setup [:create_paid_bill]

    test "redirects when data is valid", %{conn: conn, paid_bill: paid_bill} do
      conn = put(conn, Routes.paid_bill_path(conn, :update, paid_bill), paid_bill: @update_attrs)
      assert redirected_to(conn) == Routes.paid_bill_path(conn, :show, paid_bill)

      conn = get(conn, Routes.paid_bill_path(conn, :show, paid_bill))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, paid_bill: paid_bill} do
      conn = put(conn, Routes.paid_bill_path(conn, :update, paid_bill), paid_bill: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Paid bill"
    end
  end

  describe "delete paid_bill" do
    setup [:create_paid_bill]

    test "deletes chosen paid_bill", %{conn: conn, paid_bill: paid_bill} do
      conn = delete(conn, Routes.paid_bill_path(conn, :delete, paid_bill))
      assert redirected_to(conn) == Routes.paid_bill_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.paid_bill_path(conn, :show, paid_bill))
      end
    end
  end

  defp create_paid_bill(_) do
    paid_bill = paid_bill_fixture()
    %{paid_bill: paid_bill}
  end
end
