defmodule ServerWeb.AgentsResolver do
  alias Server.{Agents}

  def list_agents(_root, _args, _info) do
    agents = Agents.list_agents()
    {:ok, agents}
  end
end
