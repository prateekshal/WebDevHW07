defmodule Hw07.Repo.Migrations.CreateTimesheets do
  use Ecto.Migration

  def change do
    create table(:timesheets) do
      add :date, :string, null: true
      add :status, :string, null: true
      add :jobid1, :string, null: true
      add :hr1, :integer, null: true
      add :jobid2, :string, null: true
      add :hr2, :integer, null: true
      add :jobid3, :string, null: true
      add :hr3, :integer, null: true
      add :jobid4, :string, null: true
      add :hr4, :integer, null: true
      add :jobid5, :string, null: true
      add :hr5, :integer, null: true
      add :jobid6, :string, null: true
      add :hr6, :integer, null: true
      add :jobid7, :string, null: true
      add :hr7, :integer, null: true
      add :jobid8, :string, null: true
      add :hr8, :integer, null: true
      add :total, :integer, null: true
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:timesheets, [:user_id])
  end
end
