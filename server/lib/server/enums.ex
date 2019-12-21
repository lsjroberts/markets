# import EctoEnum

# defenum(Side, type: :side, enums: [:buy, :sell])

import Ecto.Migration

defmodule SideEnum do
  use EctoEnum.Postgres, type: :side, enums: [:buy, :sell]
end

defmodule StrategyEnum do
  use EctoEnum.Postgres, type: :strategy, enums: [:liquidity_provider]
end

# defenum(SideEnum, :side, [:buy, :sell])
