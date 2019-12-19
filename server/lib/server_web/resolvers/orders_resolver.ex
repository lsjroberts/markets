defmodule ServerWeb.OrdersResolver do
  alias Server.{Exchange, Orders}

  def list_orders(%Exchange{} = exchange, _args, _info) do
    orders = Orders.list_orders(exchange)
    {:ok, orders}
  end

  def list_orders(_root, _args, _info) do
    orders = Orders.list_orders()
    {:ok, orders}
  end
end
