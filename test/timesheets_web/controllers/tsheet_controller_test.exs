defmodule TimesheetsWeb.TsheetControllerTest do
  use TimesheetsWeb.ConnCase

  alias Timesheets.Tsheets

  @create_attrs %{date: ~D[2010-04-17], hour1: "some hour1", hour2: "some hour2", hour3: "some hour3", hour4: "some hour4", hour5: "some hour5", hour6: "some hour6", hour7: "some hour7", hour8: "some hour8", status: "some status"}
  @update_attrs %{date: ~D[2011-05-18], hour1: "some updated hour1", hour2: "some updated hour2", hour3: "some updated hour3", hour4: "some updated hour4", hour5: "some updated hour5", hour6: "some updated hour6", hour7: "some updated hour7", hour8: "some updated hour8", status: "some updated status"}
  @invalid_attrs %{date: nil, hour1: nil, hour2: nil, hour3: nil, hour4: nil, hour5: nil, hour6: nil, hour7: nil, hour8: nil, status: nil}

  def fixture(:tsheet) do
    {:ok, tsheet} = Tsheets.create_tsheet(@create_attrs)
    tsheet
  end

  describe "index" do
    test "lists all tsheets", %{conn: conn} do
      conn = get(conn, Routes.tsheet_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Tsheets"
    end
  end

  describe "new tsheet" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.tsheet_path(conn, :new))
      assert html_response(conn, 200) =~ "New Tsheet"
    end
  end

  describe "create tsheet" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.tsheet_path(conn, :create), tsheet: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.tsheet_path(conn, :show, id)

      conn = get(conn, Routes.tsheet_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Tsheet"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.tsheet_path(conn, :create), tsheet: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Tsheet"
    end
  end

  describe "edit tsheet" do
    setup [:create_tsheet]

    test "renders form for editing chosen tsheet", %{conn: conn, tsheet: tsheet} do
      conn = get(conn, Routes.tsheet_path(conn, :edit, tsheet))
      assert html_response(conn, 200) =~ "Edit Tsheet"
    end
  end

  describe "update tsheet" do
    setup [:create_tsheet]

    test "redirects when data is valid", %{conn: conn, tsheet: tsheet} do
      conn = put(conn, Routes.tsheet_path(conn, :update, tsheet), tsheet: @update_attrs)
      assert redirected_to(conn) == Routes.tsheet_path(conn, :show, tsheet)

      conn = get(conn, Routes.tsheet_path(conn, :show, tsheet))
      assert html_response(conn, 200) =~ "some updated hour1"
    end

    test "renders errors when data is invalid", %{conn: conn, tsheet: tsheet} do
      conn = put(conn, Routes.tsheet_path(conn, :update, tsheet), tsheet: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Tsheet"
    end
  end

  describe "delete tsheet" do
    setup [:create_tsheet]

    test "deletes chosen tsheet", %{conn: conn, tsheet: tsheet} do
      conn = delete(conn, Routes.tsheet_path(conn, :delete, tsheet))
      assert redirected_to(conn) == Routes.tsheet_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.tsheet_path(conn, :show, tsheet))
      end
    end
  end

  defp create_tsheet(_) do
    tsheet = fixture(:tsheet)
    {:ok, tsheet: tsheet}
  end
end
