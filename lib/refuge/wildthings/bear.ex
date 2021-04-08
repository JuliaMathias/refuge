defmodule Refuge.Wildthings.Bear do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bears" do
    field :hibernating, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(bear, attrs) do
    bear
    |> cast(attrs, [:name, :hibernating])
    |> validate_required([:name, :hibernating])
  end
end
