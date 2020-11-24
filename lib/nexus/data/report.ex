defmodule Nexus.Data.Report do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reports" do
    field :device_id, :integer
    field :sent_at, :utc_datetime

    timestamps(updated_at: false)

    has_many :sensor_data, Nexus.Data.SensorData
  end

  @doc false
  def changeset(report, attrs) do
    report
    |> cast(attrs, [:device_id, :sent_at])
    |> validate_required([:device_id, :sent_at])
  end
end
