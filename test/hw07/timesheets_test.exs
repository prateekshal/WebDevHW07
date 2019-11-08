defmodule Hw07.TimesheetsTest do
  use Hw07.DataCase

  alias Hw07.Timesheets

  describe "timesheets" do
    alias Hw07.Timesheets.Timesheet

    @valid_attrs %{date: ~D[2010-04-17], hr1: 42, hr2: 42, hr3: 42, hr4: 42, hr5: 42, hr6: 42, hr7: 42, hr8: 42, jobid1: "some jobid1", jobid2: "some jobid2", jobid3: "some jobid3", jobid4: "some jobid4", jobid5: "some jobid5", jobid6: "some jobid6", jobid7: "some jobid7", jobid8: "some jobid8"}
    @update_attrs %{date: ~D[2011-05-18], hr1: 43, hr2: 43, hr3: 43, hr4: 43, hr5: 43, hr6: 43, hr7: 43, hr8: 43, jobid1: "some updated jobid1", jobid2: "some updated jobid2", jobid3: "some updated jobid3", jobid4: "some updated jobid4", jobid5: "some updated jobid5", jobid6: "some updated jobid6", jobid7: "some updated jobid7", jobid8: "some updated jobid8"}
    @invalid_attrs %{date: nil, hr1: nil, hr2: nil, hr3: nil, hr4: nil, hr5: nil, hr6: nil, hr7: nil, hr8: nil, jobid1: nil, jobid2: nil, jobid3: nil, jobid4: nil, jobid5: nil, jobid6: nil, jobid7: nil, jobid8: nil}

    def timesheet_fixture(attrs \\ %{}) do
      {:ok, timesheet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Timesheets.create_timesheet()

      timesheet
    end

    test "list_timesheets/0 returns all timesheets" do
      timesheet = timesheet_fixture()
      assert Timesheets.list_timesheets() == [timesheet]
    end

    test "get_timesheet!/1 returns the timesheet with given id" do
      timesheet = timesheet_fixture()
      assert Timesheets.get_timesheet!(timesheet.id) == timesheet
    end

    test "create_timesheet/1 with valid data creates a timesheet" do
      assert {:ok, %Timesheet{} = timesheet} = Timesheets.create_timesheet(@valid_attrs)
      assert timesheet.date == ~D[2010-04-17]
      assert timesheet.hr1 == 42
      assert timesheet.hr2 == 42
      assert timesheet.hr3 == 42
      assert timesheet.hr4 == 42
      assert timesheet.hr5 == 42
      assert timesheet.hr6 == 42
      assert timesheet.hr7 == 42
      assert timesheet.hr8 == 42
      assert timesheet.jobid1 == "some jobid1"
      assert timesheet.jobid2 == "some jobid2"
      assert timesheet.jobid3 == "some jobid3"
      assert timesheet.jobid4 == "some jobid4"
      assert timesheet.jobid5 == "some jobid5"
      assert timesheet.jobid6 == "some jobid6"
      assert timesheet.jobid7 == "some jobid7"
      assert timesheet.jobid8 == "some jobid8"
    end

    test "create_timesheet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timesheets.create_timesheet(@invalid_attrs)
    end

    test "update_timesheet/2 with valid data updates the timesheet" do
      timesheet = timesheet_fixture()
      assert {:ok, %Timesheet{} = timesheet} = Timesheets.update_timesheet(timesheet, @update_attrs)
      assert timesheet.date == ~D[2011-05-18]
      assert timesheet.hr1 == 43
      assert timesheet.hr2 == 43
      assert timesheet.hr3 == 43
      assert timesheet.hr4 == 43
      assert timesheet.hr5 == 43
      assert timesheet.hr6 == 43
      assert timesheet.hr7 == 43
      assert timesheet.hr8 == 43
      assert timesheet.jobid1 == "some updated jobid1"
      assert timesheet.jobid2 == "some updated jobid2"
      assert timesheet.jobid3 == "some updated jobid3"
      assert timesheet.jobid4 == "some updated jobid4"
      assert timesheet.jobid5 == "some updated jobid5"
      assert timesheet.jobid6 == "some updated jobid6"
      assert timesheet.jobid7 == "some updated jobid7"
      assert timesheet.jobid8 == "some updated jobid8"
    end

    test "update_timesheet/2 with invalid data returns error changeset" do
      timesheet = timesheet_fixture()
      assert {:error, %Ecto.Changeset{}} = Timesheets.update_timesheet(timesheet, @invalid_attrs)
      assert timesheet == Timesheets.get_timesheet!(timesheet.id)
    end

    test "delete_timesheet/1 deletes the timesheet" do
      timesheet = timesheet_fixture()
      assert {:ok, %Timesheet{}} = Timesheets.delete_timesheet(timesheet)
      assert_raise Ecto.NoResultsError, fn -> Timesheets.get_timesheet!(timesheet.id) end
    end

    test "change_timesheet/1 returns a timesheet changeset" do
      timesheet = timesheet_fixture()
      assert %Ecto.Changeset{} = Timesheets.change_timesheet(timesheet)
    end
  end
end
