defmodule Nexus.Repo.Migrations.AddSubscriptionsTable do
  use Ecto.Migration

  def change do
    create table(:subscriptions) do
      add :topic, :string, size: 255, null: false

      timestamps()
    end

    create unique_index(:subscriptions, :topic)
  end
end
