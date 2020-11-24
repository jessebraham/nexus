defmodule Nexus.Repo.Migrations.AddReportsTable do
  use Ecto.Migration

  def change do
    create table(:reports) do
      add :device_id, references(:devices), null: false
      add :sent_at, :timestamp, null: false

      timestamps(updated_at: false)
    end

    create index(:reports, [:device_id, :inserted_at])
  end
end
