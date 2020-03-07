defmodule Server.Securities do
  import Ecto.Query, warn: false
  alias Server.Repo

  alias Server.Security

  def list_securities(exchange) do
    from(s in Security, join: e in assoc(s, :exchange), where: e.id == ^exchange.id)
    |> Repo.all()
  end

  def list_securities do
    Repo.all(Security)
  end
end
