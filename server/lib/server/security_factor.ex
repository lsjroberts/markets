defmodule Server.SecurityFactor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "security_factors" do
    field(:factor, :string)
    field(:loading, :float)
    belongs_to(:security, Server.Security)

    timestamps()
  end
end
