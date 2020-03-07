defmodule Server.Repo.Migrations.CreateSecurities do
  use Ecto.Migration

  def change do
    create table(:securities) do
      add(:exchange_id, references(:exchanges, on_delete: :delete_all))

      add(:ticker, :string, null: false)
      add(:name, :string, null: false)
      add(:shares, :integer, null: false)

      timestamps()
    end
  end
end
