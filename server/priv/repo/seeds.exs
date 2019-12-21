alias Server.Agent
alias Server.Exchange
alias Server.Order
alias Server.Repo

mxse = %Exchange{name: "MXSE"} |> Repo.insert!()

liquid_one = %Agent{name: Agent.generate_name(), strategy: :liquidity_provider} |> Repo.insert!()
