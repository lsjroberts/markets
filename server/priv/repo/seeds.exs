alias Server.Agent

alias Server.Exchange
alias Server.Order
alias Server.Repo
alias Server.Security

mxse = %Exchange{name: "MXSE"} |> Repo.insert!()

ipo_one = %Agent{name: Agent.generate_name(), strategy: :ipo} |> Repo.insert!()
liquid_one = %Agent{name: Agent.generate_name(), strategy: :liquidity_provider} |> Repo.insert!()

for i <- 0..9 do
  target_one = %Agent{name: Agent.generate_name(), strategy: :target_exposure} |> Repo.insert!()
end

words =
  File.stream!(Path.relative_to_cwd("assets/words.txt")) |> Stream.map(&String.trim_trailing/1)

for i <- 0..99 do
  name = Security.generate_name(words)

  %Security{
    exchange: mxse,
    ticker: Security.generate_ticker(name),
    name: name,
    shares: 1 * 1000 * 1000 * 1000
  }
  |> Repo.insert!()
end
