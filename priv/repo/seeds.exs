# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Nexus.Repo.insert!(%Nexus.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# We will provide a small number of default sensor types.

alias Nexus.Data.SensorType

Nexus.Repo.insert!(
  %SensorType{}
  |> SensorType.changeset(%{type: "temperature", units: "°C"})
)

Nexus.Repo.insert!(
  %SensorType{}
  |> SensorType.changeset(%{type: "humidity", units: "%"})
)

Nexus.Repo.insert!(
  %SensorType{}
  |> SensorType.changeset(%{type: "pressure", units: "kPa"})
)
