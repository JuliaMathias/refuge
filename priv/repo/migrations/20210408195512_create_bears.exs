defmodule Refuge.Repo.Migrations.CreateBears do
  use Ecto.Migration

  def change do
    create table(:bears) do
      add :name, :string
      add :hibernating, :boolean, default: false, null: false

      timestamps()
    end

  end
end
