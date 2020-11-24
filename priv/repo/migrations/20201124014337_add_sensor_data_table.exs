defmodule Nexus.Repo.Migrations.AddSensorDataTable do
  use Ecto.Migration

  def change do
    create table(:sensor_data) do
      add :report_id, references(:reports), null: false
      add :sensor_type_id, references(:sensor_types), null: false
      add :value, :decimal, null: false
    end
  end
end
