alias Server.Exchange
alias Server.Repo

%Exchange{name: "FOO"} |> Repo.insert!()
