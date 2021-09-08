defmodule BillPlannerWeb.BillControllerTest do
  use BillPlannerWeb.ConnCase

  import BillPlanner.BillsFixtures

  @create_attrs %{finish_date: ~D[2021-09-02], recurrence_in_days: 42, start_date: ~D[2021-09-02]}
  @update_attrs %{finish_date: ~D[2021-09-03], recurrence_in_days: 43, start_date: ~D[2021-09-03]}
  @invalid_attrs %{finish_date: nil, recurrence: nil, start_date: nil}

  describe "index" do
    test "lists all bills", %{conn: conn} do
      conn = get(conn, Routes.bill_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Bills"
    end
  end

  describe "new bill" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.bill_path(conn, :new))
      assert html_response(conn, 200) =~ "New Bill"
    end
  end

  describe "create bill" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.bill_path(conn, :create), bill: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.bill_path(conn, :show, id)

      conn = get(conn, Routes.bill_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Bill"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.bill_path(conn, :create), bill: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Bill"
    end
  end

  describe "edit bill" do
    setup [:create_bill]

    test "renders form for editing chosen bill", %{conn: conn, bill: bill} do
      conn = get(conn, Routes.bill_path(conn, :edit, bill))
      assert html_response(conn, 200) =~ "Edit Bill"
    end
  end

  describe "update bill" do
    setup [:create_bill]

    test "redirects when data is valid", %{conn: conn, bill: bill} do
      conn = put(conn, Routes.bill_path(conn, :update, bill), bill: @update_attrs)
      assert redirected_to(conn) == Routes.bill_path(conn, :show, bill)

      conn = get(conn, Routes.bill_path(conn, :show, bill))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, bill: bill} do
      conn = put(conn, Routes.bill_path(conn, :update, bill), bill: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Bill"
    end
  end

  describe "delete bill" do
    setup [:create_bill]

    test "deletes chosen bill", %{conn: conn, bill: bill} do
      conn = delete(conn, Routes.bill_path(conn, :delete, bill))
      assert redirected_to(conn) == Routes.bill_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.bill_path(conn, :show, bill))
      end
    end
  end

  defp create_bill(_) do
    bill = bill_fixture()
    %{bill: bill}
  end
end
