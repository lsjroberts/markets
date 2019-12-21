defmodule Server.Agents do
  import Ecto.Query, warn: false
  alias Server.Repo

  alias Server.Agent

  def list_agents do
    Repo.all(Agent)
  end

  def get_agent!(id), do: Repo.get!(Agent, id)
end
