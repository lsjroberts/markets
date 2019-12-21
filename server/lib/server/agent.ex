defmodule Server.Agent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "agents" do
    field(:name, :string)
    field(:strategy, StrategyEnum)

    timestamps()
  end

  def generate_name() do
    "Hello There"
  end

  @doc false
  def changeset(exchange, attrs) do
    exchange
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
