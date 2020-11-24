defmodule Nexus.Data.Device do
  use Ecto.Schema
  import Ecto.Changeset

  schema "devices" do
    field :client_id, :string
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(device, attrs) do
    device
    |> cast(attrs, [:client_id, :title, :description])
    |> validate_required(:client_id)
    |> unique_constraint(:client_id)
  end
end
