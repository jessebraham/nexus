defmodule Nexus.Data.SensorType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sensor_types" do
    field :type, :string
    field :units, :string
  end

  @doc false
  def changeset(sensor_type, attrs) do
    sensor_type
    |> cast(attrs, [:type, :units])
    |> validate_required([:type, :units])
    |> unique_constraint(:type)
  end
end
