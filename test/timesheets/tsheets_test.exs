defmodule Timesheets.TsheetsTest do
  use Timesheets.DataCase

  alias Timesheets.Tsheets

  describe "tsheets" do
    alias Timesheets.Tsheets.Tsheet

    @valid_attrs %{date: ~D[2010-04-17], status: "some status", task: %{}}
    @update_attrs %{date: ~D[2011-05-18], status: "some updated status", task: %{}}
    @invalid_attrs %{date: nil, status: nil, task: nil}

    def tsheet_fixture(attrs \\ %{}) do
      {:ok, tsheet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tsheets.create_tsheet()

      tsheet
    end

    test "list_tsheets/0 returns all tsheets" do
      tsheet = tsheet_fixture()
      assert Tsheets.list_tsheets() == [tsheet]
    end

    test "get_tsheet!/1 returns the tsheet with given id" do
      tsheet = tsheet_fixture()
      assert Tsheets.get_tsheet!(tsheet.id) == tsheet
    end

    test "create_tsheet/1 with valid data creates a tsheet" do
      assert {:ok, %Tsheet{} = tsheet} = Tsheets.create_tsheet(@valid_attrs)
      assert tsheet.date == ~D[2010-04-17]
      assert tsheet.status == "some status"
      assert tsheet.task == %{}
    end

    test "create_tsheet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tsheets.create_tsheet(@invalid_attrs)
    end

    test "update_tsheet/2 with valid data updates the tsheet" do
      tsheet = tsheet_fixture()
      assert {:ok, %Tsheet{} = tsheet} = Tsheets.update_tsheet(tsheet, @update_attrs)
      assert tsheet.date == ~D[2011-05-18]
      assert tsheet.status == "some updated status"
      assert tsheet.task == %{}
    end

    test "update_tsheet/2 with invalid data returns error changeset" do
      tsheet = tsheet_fixture()
      assert {:error, %Ecto.Changeset{}} = Tsheets.update_tsheet(tsheet, @invalid_attrs)
      assert tsheet == Tsheets.get_tsheet!(tsheet.id)
    end

    test "delete_tsheet/1 deletes the tsheet" do
      tsheet = tsheet_fixture()
      assert {:ok, %Tsheet{}} = Tsheets.delete_tsheet(tsheet)
      assert_raise Ecto.NoResultsError, fn -> Tsheets.get_tsheet!(tsheet.id) end
    end

    test "change_tsheet/1 returns a tsheet changeset" do
      tsheet = tsheet_fixture()
      assert %Ecto.Changeset{} = Tsheets.change_tsheet(tsheet)
    end
  end

  describe "tsheets" do
    alias Timesheets.Tsheets.Tsheet

    @valid_attrs %{date: ~D[2010-04-17], hour1: "some hour1", hour2: "some hour2", hour3: "some hour3", hour4: "some hour4", hour5: "some hour5", hour6: "some hour6", hour7: "some hour7", hour8: "some hour8", status: "some status"}
    @update_attrs %{date: ~D[2011-05-18], hour1: "some updated hour1", hour2: "some updated hour2", hour3: "some updated hour3", hour4: "some updated hour4", hour5: "some updated hour5", hour6: "some updated hour6", hour7: "some updated hour7", hour8: "some updated hour8", status: "some updated status"}
    @invalid_attrs %{date: nil, hour1: nil, hour2: nil, hour3: nil, hour4: nil, hour5: nil, hour6: nil, hour7: nil, hour8: nil, status: nil}

    def tsheet_fixture(attrs \\ %{}) do
      {:ok, tsheet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tsheets.create_tsheet()

      tsheet
    end

    test "list_tsheets/0 returns all tsheets" do
      tsheet = tsheet_fixture()
      assert Tsheets.list_tsheets() == [tsheet]
    end

    test "get_tsheet!/1 returns the tsheet with given id" do
      tsheet = tsheet_fixture()
      assert Tsheets.get_tsheet!(tsheet.id) == tsheet
    end

    test "create_tsheet/1 with valid data creates a tsheet" do
      assert {:ok, %Tsheet{} = tsheet} = Tsheets.create_tsheet(@valid_attrs)
      assert tsheet.date == ~D[2010-04-17]
      assert tsheet.hour1 == "some hour1"
      assert tsheet.hour2 == "some hour2"
      assert tsheet.hour3 == "some hour3"
      assert tsheet.hour4 == "some hour4"
      assert tsheet.hour5 == "some hour5"
      assert tsheet.hour6 == "some hour6"
      assert tsheet.hour7 == "some hour7"
      assert tsheet.hour8 == "some hour8"
      assert tsheet.status == "some status"
    end

    test "create_tsheet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tsheets.create_tsheet(@invalid_attrs)
    end

    test "update_tsheet/2 with valid data updates the tsheet" do
      tsheet = tsheet_fixture()
      assert {:ok, %Tsheet{} = tsheet} = Tsheets.update_tsheet(tsheet, @update_attrs)
      assert tsheet.date == ~D[2011-05-18]
      assert tsheet.hour1 == "some updated hour1"
      assert tsheet.hour2 == "some updated hour2"
      assert tsheet.hour3 == "some updated hour3"
      assert tsheet.hour4 == "some updated hour4"
      assert tsheet.hour5 == "some updated hour5"
      assert tsheet.hour6 == "some updated hour6"
      assert tsheet.hour7 == "some updated hour7"
      assert tsheet.hour8 == "some updated hour8"
      assert tsheet.status == "some updated status"
    end

    test "update_tsheet/2 with invalid data returns error changeset" do
      tsheet = tsheet_fixture()
      assert {:error, %Ecto.Changeset{}} = Tsheets.update_tsheet(tsheet, @invalid_attrs)
      assert tsheet == Tsheets.get_tsheet!(tsheet.id)
    end

    test "delete_tsheet/1 deletes the tsheet" do
      tsheet = tsheet_fixture()
      assert {:ok, %Tsheet{}} = Tsheets.delete_tsheet(tsheet)
      assert_raise Ecto.NoResultsError, fn -> Tsheets.get_tsheet!(tsheet.id) end
    end

    test "change_tsheet/1 returns a tsheet changeset" do
      tsheet = tsheet_fixture()
      assert %Ecto.Changeset{} = Tsheets.change_tsheet(tsheet)
    end
  end
end
