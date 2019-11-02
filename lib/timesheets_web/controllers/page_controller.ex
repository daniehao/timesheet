defmodule TimesheetsWeb.PageController do
  use TimesheetsWeb, :controller
  alias Timesheets.Workers
  alias Timesheets.Managers
  alias Timesheets.Sheets

  def index(conn, _params) do
    render conn, "index.html"
  end

  def worker(conn, %{"email" => email}) do
    IO.puts("worker:")
    IO.puts(email)
    worker = Workers.get_worker_with_sheets!(email)
    IO.inspect(worker)
    render conn, "worker.html", worker: worker
  end

  def manager(conn, %{"email" => email}) do
    IO.puts("manager:")
    IO.puts(email)
    manager = Managers.get_manager_with_workers!(email)
    IO.inspect(manager)
    render conn, "manager.html", manager: manager
  end

  def approve(conn, %{"id" => id}) do 
    IO.puts(id)
    sheet = Sheets.get_sheet!(id)
    case Sheets.update_sheet(sheet, %{"status" => "Approved"}) do
      {:ok, sheet} ->
        conn
        |> put_flash(:info, "Timesheet approved successfully.")
        |> redirect(to: Routes.page_path(conn, :manager, conn.assigns[:current_user].email))
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:info, "Sheet update failed.")
        |> redirect(to: Routes.page_path(conn, :manager, conn.assigns[:current_user].email))
    end
  end
end
