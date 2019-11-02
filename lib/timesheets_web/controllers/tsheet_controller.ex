defmodule TimesheetsWeb.TsheetController do
  use TimesheetsWeb, :controller

  alias Timesheets.Tsheets
  alias Timesheets.Tsheets.Tsheet

  def index(conn, _params) do
    tsheets = Tsheets.list_tsheets()
    render(conn, "index.html", tsheets: tsheets)
  end

  def new(conn, _params) do
    changeset = Tsheets.change_tsheet(%Tsheet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tsheet" => tsheet_params}) do
    case Tsheets.create_tsheet(tsheet_params) do
      {:ok, tsheet} ->
        conn
        |> put_flash(:info, "Tsheet created successfully.")
        |> redirect(to: Routes.tsheet_path(conn, :show, tsheet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tsheet = Tsheets.get_tsheet!(id)
    render(conn, "show.html", tsheet: tsheet)
  end

  def edit(conn, %{"id" => id}) do
    tsheet = Tsheets.get_tsheet!(id)
    changeset = Tsheets.change_tsheet(tsheet)
    render(conn, "edit.html", tsheet: tsheet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tsheet" => tsheet_params}) do
    tsheet = Tsheets.get_tsheet!(id)

    case Tsheets.update_tsheet(tsheet, tsheet_params) do
      {:ok, tsheet} ->
        conn
        |> put_flash(:info, "Tsheet updated successfully.")
        |> redirect(to: Routes.tsheet_path(conn, :show, tsheet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tsheet: tsheet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tsheet = Tsheets.get_tsheet!(id)
    {:ok, _tsheet} = Tsheets.delete_tsheet(tsheet)

    conn
    |> put_flash(:info, "Tsheet deleted successfully.")
    |> redirect(to: Routes.tsheet_path(conn, :index))
  end
end
