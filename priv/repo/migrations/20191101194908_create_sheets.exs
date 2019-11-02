defmodule Timesheets.Repo.Migrations.CreateSheets do
  use Ecto.Migration

  def change do
    create table(:sheets) do
      add :date, :date, null: false
      add :hour1, :string, null: true
      add :hour2, :string, null: true
      add :hour3, :string, null: true
      add :hour4, :string, null: true
      add :hour5, :string, null: true
      add :hour6, :string, null: true
      add :hour7, :string, null: true
      add :hour8, :string, null: true
      add :status, :string, null: false
      add :worker_id, references(:workers, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:sheets, [:worker_id])
    
 
  end
end
