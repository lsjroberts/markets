defmodule ServerWeb.ExchangesResolver do
  alias Server.{Exchanges}

  def list_exchanges(_root, _args, _info) do
    exchanges = Exchanges.list_exchanges()
    {:ok, exchanges}
  end
end
