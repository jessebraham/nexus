defmodule Nexus.Repo.Migrations.AddSensorTypesTable do
  use Ecto.Migration

  def change do
    create table(:sensor_types) do
      add :type, :string, size: 32, null: false
      add :units, :string, size: 8, null: false
    end

    create unique_index(:sensor_types, :type)
  end
end
