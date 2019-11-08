defmodule Hw07Web.TimesheetControllerTest do
  use Hw07Web.ConnCase

  alias Hw07.Timesheets
  alias Hw07.Timesheets.Timesheet

  @create_attrs %{
    date: ~D[2010-04-17],
    hr1: 42,
    hr2: 42,
    hr3: 42,
    hr4: 42,
    hr5: 42,
    hr6: 42,
    hr7: 42,
    hr8: 42,
    jobid1: "some jobid1",
    jobid2: "some jobid2",
    jobid3: "some jobid3",
    jobid4: "some jobid4",
    jobid5: "some jobid5",
    jobid6: "some jobid6",
    jobid7: "some jobid7",
    jobid8: "some jobid8"
  }
  @update_attrs %{
    date: ~D[2011-05-18],
    hr1: 43,
    hr2: 43,
    hr3: 43,
    hr4: 43,
    hr5: 43,
    hr6: 43,
    hr7: 43,
    hr8: 43,
    jobid1: "some updated jobid1",
    jobid2: "some updated jobid2",
    jobid3: "some updated jobid3",
    jobid4: "some updated jobid4",
    jobid5: "some updated jobid5",
    jobid6: "some updated jobid6",
    jobid7: "some updated jobid7",
    jobid8: "some updated jobid8"
  }
  @invalid_attrs %{date: nil, hr1: nil, hr2: nil, hr3: nil, hr4: nil, hr5: nil, hr6: nil, hr7: nil, hr8: nil, jobid1: nil, jobid2: nil, jobid3: nil, jobid4: nil, jobid5: nil, jobid6: nil, jobid7: nil, jobid8: nil}

  def fixture(:timesheet) do
    {:ok, timesheet} = Timesheets.create_timesheet(@create_attrs)
    timesheet
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all timesheets", %{conn: conn} do
      conn = get(conn, Routes.timesheet_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create timesheet" do
    test "renders timesheet when data is valid", %{conn: conn} do
      conn = post(conn, Routes.timesheet_path(conn, :create), timesheet: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.timesheet_path(conn, :show, id))

      assert %{
               "id" => id,
               "date" => "2010-04-17",
               "hr1" => 42,
               "hr2" => 42,
               "hr3" => 42,
               "hr4" => 42,
               "hr5" => 42,
               "hr6" => 42,
               "hr7" => 42,
               "hr8" => 42,
               "jobid1" => "some jobid1",
               "jobid2" => "some jobid2",
               "jobid3" => "some jobid3",
               "jobid4" => "some jobid4",
               "jobid5" => "some jobid5",
               "jobid6" => "some jobid6",
               "jobid7" => "some jobid7",
               "jobid8" => "some jobid8"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.timesheet_path(conn, :create), timesheet: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update timesheet" do
    setup [:create_timesheet]

    test "renders timesheet when data is valid", %{conn: conn, timesheet: %Timesheet{id: id} = timesheet} do
      conn = put(conn, Routes.timesheet_path(conn, :update, timesheet), timesheet: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.timesheet_path(conn, :show, id))

      assert %{
               "id" => id,
               "date" => "2011-05-18",
               "hr1" => 43,
               "hr2" => 43,
               "hr3" => 43,
               "hr4" => 43,
               "hr5" => 43,
               "hr6" => 43,
               "hr7" => 43,
               "hr8" => 43,
               "jobid1" => "some updated jobid1",
               "jobid2" => "some updated jobid2",
               "jobid3" => "some updated jobid3",
               "jobid4" => "some updated jobid4",
               "jobid5" => "some updated jobid5",
               "jobid6" => "some updated jobid6",
               "jobid7" => "some updated jobid7",
               "jobid8" => "some updated jobid8"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, timesheet: timesheet} do
      conn = put(conn, Routes.timesheet_path(conn, :update, timesheet), timesheet: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete timesheet" do
    setup [:create_timesheet]

    test "deletes chosen timesheet", %{conn: conn, timesheet: timesheet} do
      conn = delete(conn, Routes.timesheet_path(conn, :delete, timesheet))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.timesheet_path(conn, :show, timesheet))
      end
    end
  end

  defp create_timesheet(_) do
    timesheet = fixture(:timesheet)
    {:ok, timesheet: timesheet}
  end
end
