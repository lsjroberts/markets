defmodule Server.Exchange do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exchanges" do
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(exchange, attrs) do
    exchange
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
