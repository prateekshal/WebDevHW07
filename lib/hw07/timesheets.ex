defmodule Hw07.Timesheets do
  @moduledoc """
  The Timesheets context.
  """

  import Ecto.Query, warn: false
  alias Hw07.Repo

  alias Hw07.Timesheets.Timesheet
  alias Hw07.Users.User

  @doc """
  Returns the list of timesheets.

  ## Examples

      iex> list_timesheets()
      [%Timesheet{}, ...]

  """
  def list_timesheets(id) do
    query = from(t in Timesheet, where: t.user_id == ^id, select: t)
    Repo.all(query)
  end

  def list_timesheets() do
    Repo.all(Timesheet)
  end

  def getworkers(id) do
    query = from(u in Hw07.Users.User, where: u.managerid == ^id, select: u.id)
    Repo.all(query)
  end

  def get_timesheets(workers) do
    query = from(t in Timesheet, where: t.user_id in ^workers, select: t)
    Repo.all(query)
  end

  @doc """
  Gets a single timesheet.

  Raises `Ecto.NoResultsError` if the Timesheet does not exist.

  ## Examples

      iex> get_timesheet!(123)
      %Timesheet{}

      iex> get_timesheet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_timesheet!(id), do: Repo.get!(Timesheet, id)

  @doc """
  Creates a timesheet.

  ## Examples

      iex> create_timesheet(%{field: value})
      {:ok, %Timesheet{}}

      iex> create_timesheet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_timesheet(attrs \\ %{}) do
    %Timesheet{}
    |> Timesheet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a timesheet.

  ## Examples

      iex> update_timesheet(timesheet, %{field: new_value})
      {:ok, %Timesheet{}}

      iex> update_timesheet(timesheet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_timesheet(%Timesheet{} = timesheet, attrs) do
    timesheet
    |> Timesheet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Timesheet.

  ## Examples

      iex> delete_timesheet(timesheet)
      {:ok, %Timesheet{}}

      iex> delete_timesheet(timesheet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_timesheet(%Timesheet{} = timesheet) do
    Repo.delete(timesheet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking timesheet changes.

  ## Examples

      iex> change_timesheet(timesheet)
      %Ecto.Changeset{source: %Timesheet{}}

  """
  def change_timesheet(%Timesheet{} = timesheet) do
    Timesheet.changeset(timesheet, %{})
  end
end
