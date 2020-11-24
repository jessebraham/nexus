defmodule Nexus.Data.SensorData do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sensor_data" do
    belongs_to :report, Nexus.Data.Report
    belongs_to :sensor_type, Nexus.Data.SensorType
    field :value, :decimal
  end

  @doc false
  def changeset(sensor_data, attrs) do
    sensor_data
    |> cast(attrs, [:report_id, :sensor_type_id, :value])
    |> validate_required([:report_id, :sensor_type_id, :value])
  end
end
