# import EctoEnum

# defenum(Side, type: :side, enums: [:buy, :sell])

import Ecto.Migration

defmodule SideEnum do
  use EctoEnum.Postgres, type: :side, enums: [:buy, :sell]
end

defmodule StrategyEnum do
  use EctoEnum.Postgres, type: :strategy, enums: [:ipo, :liquidity_provider, :target_exposure]
end

# defenum(SideEnum, :side, [:buy, :sell])
