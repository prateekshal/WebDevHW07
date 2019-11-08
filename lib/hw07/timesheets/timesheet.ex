defmodule Hw07.Timesheets.Timesheet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "timesheets" do
    field :date, :string
    field :hr1, :integer
    field :hr2, :integer
    field :hr3, :integer
    field :hr4, :integer
    field :hr5, :integer
    field :hr6, :integer
    field :hr7, :integer
    field :hr8, :integer
    field :jobid1, :string
    field :jobid2, :string
    field :jobid3, :string
    field :jobid4, :string
    field :jobid5, :string
    field :jobid6, :string
    field :jobid7, :string
    field :jobid8, :string
    field :total, :integer
    field :status, :string

    belongs_to :user, Hw06.Users.User

    timestamps()
  end

  @doc false
  def changeset(timesheet, attrs) do
    timesheet
    |> cast(attrs, [:date, :hr1, :hr2, :hr3, :hr4, :hr5, :hr6, :hr6, :hr7, :hr8, :jobid1, :jobid2, :jobid3, :jobid4, :jobid5, :jobid6, :jobid7, :jobid8, :user_id, :status])
    |> validate_required([:date, :user_id])
  end
end
