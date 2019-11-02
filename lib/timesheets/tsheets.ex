defmodule Timesheets.Tsheets do
  @moduledoc """
  The Tsheets context.
  """

  import Ecto.Query, warn: false
  alias Timesheets.Repo

  alias Timesheets.Tsheets.Tsheet

  @doc """
  Returns the list of tsheets.

  ## Examples

      iex> list_tsheets()
      [%Tsheet{}, ...]

  """
  def list_tsheets do
    Repo.all(Tsheet)
  end

  @doc """
  Gets a single tsheet.

  Raises `Ecto.NoResultsError` if the Tsheet does not exist.

  ## Examples

      iex> get_tsheet!(123)
      %Tsheet{}

      iex> get_tsheet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tsheet!(id), do: Repo.get!(Tsheet, id)

  @doc """
  Creates a tsheet.

  ## Examples

      iex> create_tsheet(%{field: value})
      {:ok, %Tsheet{}}

      iex> create_tsheet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tsheet(attrs \\ %{}) do
    %Tsheet{}
    |> Tsheet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tsheet.

  ## Examples

      iex> update_tsheet(tsheet, %{field: new_value})
      {:ok, %Tsheet{}}

      iex> update_tsheet(tsheet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tsheet(%Tsheet{} = tsheet, attrs) do
    tsheet
    |> Tsheet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tsheet.

  ## Examples

      iex> delete_tsheet(tsheet)
      {:ok, %Tsheet{}}

      iex> delete_tsheet(tsheet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tsheet(%Tsheet{} = tsheet) do
    Repo.delete(tsheet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tsheet changes.

  ## Examples

      iex> change_tsheet(tsheet)
      %Ecto.Changeset{source: %Tsheet{}}

  """
  def change_tsheet(%Tsheet{} = tsheet) do
    Tsheet.changeset(tsheet, %{})
  end
end
