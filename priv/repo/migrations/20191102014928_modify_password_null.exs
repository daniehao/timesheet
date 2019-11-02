defmodule Timesheets.Repo.Migrations.ModifyPasswordNull do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify(:password, :string, null: true)
    end
  end
end
