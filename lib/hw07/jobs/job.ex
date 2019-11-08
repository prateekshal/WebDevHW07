defmodule Hw07.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :budget, :decimal
    field :desc, :string
    field :jobid, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:jobid, :desc, :name, :budget])
    |> validate_required([:jobid, :desc, :name, :budget])
  end
end
