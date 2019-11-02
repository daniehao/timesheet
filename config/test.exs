use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :timesheets, TimesheetsWeb.Endpoint,
  http: [port: 5002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :timesheets, Timesheets.Repo,
  username: "timesheets",
  password: "kieSavaaxei2",
  database: "timesheets_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
