defmodule Nexus.Repo.Migrations.AddDevicesTable do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :client_id, :string, size: 24, null: false
      add :title, :string, size: 64
      add :description, :text

      timestamps()
    end

    create unique_index(:devices, :client_id)
  end
end
