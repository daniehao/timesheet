defmodule Timesheets.Repo.Migrations.ModifyNull do
  use Ecto.Migration

  def change do
    alter table(:sheets) do
      modify :hour1, :string, null: true
      modify :hour2, :string, null: true
      modify :hour3, :string, null: true
      modify :hour4, :string, null: true
      modify :hour5, :string, null: true
      modify :hour6, :string, null: true
      modify :hour7, :string, null: true
      modify :hour8, :string, null: true
    end
  end
end
