defmodule Hw07.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :jobid, :string
      add :desc, :text
      add :name, :string
      add :budget, :decimal

      timestamps()
    end

  end
end
