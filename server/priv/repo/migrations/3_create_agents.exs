defmodule Server.Repo.Migrations.CreateAgents do
  use Ecto.Migration

  def change do
    create table(:agents) do
      add(:name, :string, null: false)
      add(:strategy, :string, null: false)

      timestamps()
    end
  end
end
