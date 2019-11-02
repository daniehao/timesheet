# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Timesheets.Repo.insert!(%Timesheets.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#


alias Timesheets.Repo
alias Timesheets.Users.User
alias Timesheets.Managers.Manager
alias Timesheets.Managers
alias Timesheets.Workers.Worker
alias Timesheets.Jobs.Job

user = %{name: "Alice Anderson", email: "alice@acme.com", is_manager: true, password: "password1234", password_confirmation: "password1234"}
user = User.changeset(%User{},user)
Repo.insert!(%User{name: "Alice Anderson", email: "alice@acme.com", is_manager: true, password_hash: user.changes.password_hash})

user = %{name: "Bob Anderson", email: "bob@acme.com", is_manager: true, password: "password1234", password_confirmation: "password1234"}
user = User.changeset(%User{},user)
Repo.insert!(%User{name: "Bob Anderson", email: "bob@acme.com", is_manager: true, password_hash: user.changes.password_hash})

user = %{name: "Carol Anderson", email: "carol@acme.com", is_manager: true, password: "password1234", password_confirmation: "password1234"}
user = User.changeset(%User{},user)
Repo.insert!(%User{name: "Carol Anderson", email: "carol@acme.com", is_manager: false, password_hash: user.changes.password_hash})

user = %{name: "Dave Anderson", email: "dave@acme.com", is_manager: false, password: "password1234", password_confirmation: "password1234"}
user = User.changeset(%User{},user)
Repo.insert!(%User{name: "Dave Anderson", email: "dave@acme.com", is_manager: false, password_hash: user.changes.password_hash})

user = %{name: "Peter Anderson", email: "peter@acme.com", is_manager: false, password: "password1234", password_confirmation: "password1234"}
user = User.changeset(%User{},user)
Repo.insert!(%User{name: "Peter Anderson", email: "peter@acme.com", is_manager: false, password_hash: user.changes.password_hash})

user = %{name: "Danie Hao", email: "danie@acme.com", is_manager: true, password: "password1234", password_confirmation: "password1234"}
user = User.changeset(%User{},user)
Repo.insert!(%User{name: "Danie Hao", email: "danie@acme.com", is_manager: false, password_hash: user.changes.password_hash})

Repo.insert!(%Manager{name: "Alice Anderson", email: "alice@acme.com"})
Repo.insert!(%Manager{name: "Bob Anderson", email: "bob@acme.com"})

Repo.insert!(%Job{budget: 20, description: "1", job_code: "VAOR-01", manager_id: Managers.get_manager_by_email("alice@acme.com").id})
Repo.insert!(%Job{budget: 45, description: "2", job_code: "VAOR-02", manager_id: Managers.get_manager_by_email("alice@acme.com").id})
Repo.insert!(%Job{budget: 12, description: "3", job_code: "VAOR-03", manager_id: Managers.get_manager_by_email("bob@acme.com").id})

Repo.insert!(%Worker{name: "Carol Anderson", email: "carol@acme.com", manager_id: Managers.get_manager_by_email("alice@acme.com").id})
Repo.insert!(%Worker{name: "Dave Anderson", email: "dave@acme.com", manager_id: Managers.get_manager_by_email("bob@acme.com").id})
Repo.insert!(%Worker{name: "Peter Anderson", email: "peter@acme.com", manager_id: Managers.get_manager_by_email("alice@acme.com").id})
Repo.insert!(%Worker{name: "Danie Hao", email: "danie@acme.com", manager_id: Managers.get_manager_by_email("bob@acme.com").id})
