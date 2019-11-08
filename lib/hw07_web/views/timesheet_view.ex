defmodule Hw07Web.TimesheetView do
  use Hw07Web, :view
  alias Hw07Web.TimesheetView

  def render("index.json", %{timesheets: timesheets}) do
    %{data: render_many(timesheets, TimesheetView, "timesheet.json")}
  end

  def render("show.json", %{timesheet: timesheet}) do
    %{data: render_one(timesheet, TimesheetView, "timesheet.json")}
  end

  def render("timesheet.json", %{timesheet: timesheet}) do
    %{id: timesheet.id,
      date: timesheet.date,
      hr1: timesheet.hr1,
      hr2: timesheet.hr2,
      hr3: timesheet.hr3,
      hr4: timesheet.hr4,
      hr5: timesheet.hr5,
      hr6: timesheet.hr6,
      hr6: timesheet.hr6,
      hr7: timesheet.hr7,
      hr8: timesheet.hr8,
      jobid1: timesheet.jobid1,
      jobid2: timesheet.jobid2,
      jobid3: timesheet.jobid3,
      jobid4: timesheet.jobid4,
      jobid5: timesheet.jobid5,
      jobid6: timesheet.jobid6,
      jobid7: timesheet.jobid7,
      jobid8: timesheet.jobid8,
      status: timesheet.status,
      user_id: timesheet.user_id}
  end
end
