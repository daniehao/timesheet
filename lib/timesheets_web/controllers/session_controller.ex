defmodule TimesheetsWeb.SessionController do
  use TimesheetsWeb, :controller
  alias Timesheets.Users  

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"email" => email, "password" => password}) do
    user = Timesheets.Users.authenticate(email, password)
    if user do
      if user.is_manager do
        conn
        |> put_session(:user_id, user.id)
        |> put_flash(:info, "Welcome back manager #{user.name}")
        |> redirect(to: "/manager/"<>user.email)
      else
        conn
        |> put_session(:user_id, user.id)
        |> put_flash(:info, "Welcome back worker #{user.name}")
        |> redirect(to: "/worker/"<>user.email)
      end
    else
      conn
      |> put_flash(:error, "Login failed.")
      |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "Logged out.")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
