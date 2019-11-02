defmodule TimesheetsWeb.Router do
  use TimesheetsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug TimesheetsWeb.Plugs.FetchCurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TimesheetsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/worker/:email", PageController, :worker
    get "/manager/:email", PageController, :manager  
    get "/approve/:id", PageController, :approve
    resources "/users", UserController
    resources "/jobs", JobController
    resources "/managers", ManagerController
    resources "/workers", WorkerController
    resources "/sheets", SheetController
    resources "/sessions", SessionController,
      only: [:new, :create, :delete], singleton: true
  end

  # Other scopes may use custom stacks.
  # scope "/api", TimesheetsWeb do
  #   pipe_through :api 
  # end
end
