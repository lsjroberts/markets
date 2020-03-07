defmodule Server.Security do
  use Ecto.Schema
  import Ecto.Changeset

  schema "securities" do
    field(:ticker, :string)
    field(:name, :string)
    field(:shares, :integer)
    belongs_to(:exchange, Server.Exchange)
    has_many(:security_factors, Server.SecurityFactor)

    timestamps()
  end

  def generate_ticker(name) do
    String.upcase(
      String.slice(
        Enum.join(
          Enum.map(String.split(name, " ", trim: true), fn s ->
            String.slice(s, 0, Enum.random(1..2))
          end)
        ),
        0,
        4
      )
    )
  end

  def generate_name(words) do
    Enum.join(
      Enum.map(0..Enum.random(0..2), fn _x ->
        String.capitalize(Enum.random(words))
      end),
      " "
    )
  end
end
