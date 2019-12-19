alias Server.Exchange
alias Server.Order
alias Server.Repo

foo = %Exchange{name: "FOO"} |> Repo.insert!()
%Order{exchange: foo, shares: 100, fulfilled: 0, side: :buy} |> Repo.insert!()
%Order{exchange: foo, shares: 100, fulfilled: 40, side: :sell} |> Repo.insert!()
%Order{exchange: foo, shares: 200, fulfilled: 20, side: :buy} |> Repo.insert!()
