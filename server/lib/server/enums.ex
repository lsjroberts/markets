# import EctoEnum

# defenum(Side, type: :side, enums: [:buy, :sell])

import Ecto.Migration

defmodule SideEnum do
  use EctoEnum.Postgres, type: :side, enums: [:buy, :sell]
end

# defenum(SideEnum, :side, [:buy, :sell])
