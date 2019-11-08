defmodule Hw07.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :password_hash, :string
      add :email, :string
      add :ismanager, :boolean, default: false, null: false
      add :managerid, :integer

      timestamps()
    end

  end
end
