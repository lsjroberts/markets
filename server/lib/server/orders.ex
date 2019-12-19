defmodule Server.Orders do
  import Ecto.Query, warn: false
  alias Server.Repo

  alias Server.Order

  def list_orders(exchange) do
    from(o in Order, join: e in assoc(o, :exchange), where: e.id == ^exchange.id)
    |> Repo.all()
  end

  def list_orders do
    Repo.all(Order)
  end
end
