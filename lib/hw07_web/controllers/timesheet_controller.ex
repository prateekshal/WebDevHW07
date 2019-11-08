defmodule Hw07Web.TimesheetController do
  use Hw07Web, :controller

  alias Hw07.Timesheets
  alias Hw07.Timesheets.Timesheet

  action_fallback Hw07Web.FallbackController

  plug Hw07Web.Plugs.RequireAuth when action in [:index, :create, :update, :delete]

  def index(conn, _params) do

    user = conn.assigns[:current_user].id
    ismanager = conn.assigns[:current_user].ismanager
    if(ismanager) do
      workers = Timesheets.getworkers(user)
      timesheets = Timesheets.get_timesheets(workers)
      render(conn, "index.json", timesheets: timesheets)
    else
      timesheets = Timesheets.list_timesheets(user)
      render(conn, "index.json", timesheets: timesheets)
    end
  end

  def create(conn, %{"timesheet" => timesheet_params}) do

    with {:ok, %Timesheet{} = timesheet} <- Timesheets.create_timesheet(timesheet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.timesheet_path(conn, :show, timesheet))
      |> render("show.json", timesheet: timesheet)
    end
  end

  def show(conn, %{"id" => id}) do
    timesheet = Timesheets.get_timesheet!(id)
    render(conn, "show.json", timesheet: timesheet)
  end

  def update(conn, %{"id" => id, "timesheet" => timesheet_params}) do
    timesheet = Timesheets.get_timesheet!(id)

    with {:ok, %Timesheet{} = timesheet} <- Timesheets.update_timesheet(timesheet, timesheet_params) do
      render(conn, "show.json", timesheet: timesheet)
    end
  end

  def delete(conn, %{"id" => id}) do
    timesheet = Timesheets.get_timesheet!(id)

    with {:ok, %Timesheet{}} <- Timesheets.delete_timesheet(timesheet) do
      send_resp(conn, :no_content, "")
    end
  end
end
