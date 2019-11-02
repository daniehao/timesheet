defmodule Timesheets.Tsheets.Tsheet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tsheets" do
    field :date, :date
    field :hour1, :string
    field :hour2, :string
    field :hour3, :string
    field :hour4, :string
    field :hour5, :string
    field :hour6, :string
    field :hour7, :string
    field :hour8, :string
    field :status, :string
    field :worker_id, :id

    timestamps()
  end

  @doc false
  def changeset(tsheet, attrs) do
    tsheet
    |> cast(attrs, [:date, :hour1, :hour2, :hour3, :hour4, :hour5, :hour6, :hour7, :hour8, :status])
    |> validate_required([:date, :hour1, :hour2, :hour3, :hour4, :hour5, :hour6, :hour7, :hour8, :status])
  end
end
