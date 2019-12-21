defmodule Server.Repo.Migrations.CreateExchanges do
  use Ecto.Migration

  def change do
    create table(:exchanges) do
      add(:name, :string, null: false)

      timestamps()
    end
  end
end
