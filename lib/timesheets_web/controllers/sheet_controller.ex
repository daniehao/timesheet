defmodule TimesheetsWeb.SheetController do
  use TimesheetsWeb, :controller

  alias Timesheets.Sheets
  alias Timesheets.Sheets.Sheet
  alias Timesheets.Workers
  alias Timesheets.Jobs

  def index(conn, _params) do
    sheets = Sheets.list_sheets()
    render(conn, "index.html", sheets: sheets)
  end

  def new(conn, _params) do
    changeset = Sheets.change_sheet(%Sheet{})
    jobs = Jobs.list_jobs()
    render(conn, "new.html", changeset: changeset, jobs: jobs)
  end

  def create(conn, %{"sheet" => sheet_params}) do
    sheet_params = sheet_params
    |>Map.put("worker_id", Workers.get_worker_by_email(conn.assigns[:current_user].email).id)
    |>Map.put("status", "Waiting")
    IO.inspect(sheet_params)
    jobs = Jobs.list_jobs()
    case Sheets.create_sheet(sheet_params) do
      {:ok, sheet} ->
        conn
        |> put_flash(:info, "Sheet created successfully.")
        |> redirect(to: Routes.page_path(conn, :worker, conn.assigns[:current_user].email))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, jobs: jobs)
    end
  end

  def show(conn, %{"id" => id}) do
    sheet = Sheets.get_sheet!(id)
    render(conn, "show.html", sheet: sheet)
  end

  def edit(conn, %{"id" => id}) do
    sheet = Sheets.get_sheet!(id)
    changeset = Sheets.change_sheet(sheet)
    render(conn, "edit.html", sheet: sheet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sheet" => sheet_params}) do
    sheet = Sheets.get_sheet!(id)
    IO.put("updating")
    IO.inspect(id)
    IO.inspect(sheet_params)
    IO.inspect(sheet)
    case Sheets.update_sheet(sheet, sheet_params) do
      {:ok, sheet} ->
        conn
        |> put_flash(:info, "Sheet updated successfully.")
        |> redirect(to: Routes.sheet_path(conn, :show, sheet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sheet: sheet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sheet = Sheets.get_sheet!(id)
    {:ok, _sheet} = Sheets.delete_sheet(sheet)

    conn
    |> put_flash(:info, "Sheet deleted successfully.")
    |> redirect(to: Routes.page_path(conn, :worker, conn.assigns[:current_user].email))
  end

end
