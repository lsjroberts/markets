defmodule Server.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field(:shares, :integer)
    field(:fulfilled, :integer)
    field(:side, SideEnum)
    belongs_to(:exchange, Server.Exchange)

    timestamps()
  end

  # @doc false
  # def changeset(order, attrs) do
  #   order
  #   |> cast(attrs, [:name])
  #   |> validate_required([:name])
  # end
end
