defmodule Server.Exchanges do
  import Ecto.Query, warn: false
  alias Server.Repo

  alias Server.Exchange

  def list_exchanges do
    Repo.all(Exchange)
  end

  def get_exchange!(id), do: Repo.get!(Exchange, id)
end
