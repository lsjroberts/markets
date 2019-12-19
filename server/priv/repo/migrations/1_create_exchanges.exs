defmodule Server.Repo.Migrations.CreateExchanges do
  use Ecto.Migration

  def change do
    create table(:exchanges) do
      add(:name, :string)

      timestamps()
    end
  end
end
