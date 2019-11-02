defmodule TimesheetsWeb.SheetControllerTest do
  use TimesheetsWeb.ConnCase

  alias Timesheets.Sheets

  @create_attrs %{date: ~D[2010-04-17], hour1: "some hour1", hour2: "some hour2", hour3: "some hour3", hour4: "some hour4", hour5: "some hour5", hour6: "some hour6", hour7: "some hour7", hour8: "some hour8", status: "some status"}
  @update_attrs %{date: ~D[2011-05-18], hour1: "some updated hour1", hour2: "some updated hour2", hour3: "some updated hour3", hour4: "some updated hour4", hour5: "some updated hour5", hour6: "some updated hour6", hour7: "some updated hour7", hour8: "some updated hour8", status: "some updated status"}
  @invalid_attrs %{date: nil, hour1: nil, hour2: nil, hour3: nil, hour4: nil, hour5: nil, hour6: nil, hour7: nil, hour8: nil, status: nil}

  def fixture(:sheet) do
    {:ok, sheet} = Sheets.create_sheet(@create_attrs)
    sheet
  end

  describe "index" do
    test "lists all sheets", %{conn: conn} do
      conn = get(conn, Routes.sheet_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sheets"
    end
  end

  describe "new sheet" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.sheet_path(conn, :new))
      assert html_response(conn, 200) =~ "New Sheet"
    end
  end

  describe "create sheet" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sheet_path(conn, :create), sheet: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.sheet_path(conn, :show, id)

      conn = get(conn, Routes.sheet_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Sheet"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sheet_path(conn, :create), sheet: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Sheet"
    end
  end

  describe "edit sheet" do
    setup [:create_sheet]

    test "renders form for editing chosen sheet", %{conn: conn, sheet: sheet} do
      conn = get(conn, Routes.sheet_path(conn, :edit, sheet))
      assert html_response(conn, 200) =~ "Edit Sheet"
    end
  end

  describe "update sheet" do
    setup [:create_sheet]

    test "redirects when data is valid", %{conn: conn, sheet: sheet} do
      conn = put(conn, Routes.sheet_path(conn, :update, sheet), sheet: @update_attrs)
      assert redirected_to(conn) == Routes.sheet_path(conn, :show, sheet)

      conn = get(conn, Routes.sheet_path(conn, :show, sheet))
      assert html_response(conn, 200) =~ "some updated hour1"
    end

    test "renders errors when data is invalid", %{conn: conn, sheet: sheet} do
      conn = put(conn, Routes.sheet_path(conn, :update, sheet), sheet: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Sheet"
    end
  end

  describe "delete sheet" do
    setup [:create_sheet]

    test "deletes chosen sheet", %{conn: conn, sheet: sheet} do
      conn = delete(conn, Routes.sheet_path(conn, :delete, sheet))
      assert redirected_to(conn) == Routes.sheet_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.sheet_path(conn, :show, sheet))
      end
    end
  end

  defp create_sheet(_) do
    sheet = fixture(:sheet)
    {:ok, sheet: sheet}
  end
end
