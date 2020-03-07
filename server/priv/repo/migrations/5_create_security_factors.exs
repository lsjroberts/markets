defmodule Server.Repo.Migrations.CreateSecurityFactors do
  use Ecto.Migration

  def change do
    create table(:security_factors) do
      add(:security_id, references(:securities, on_delete: :delete_all))

      add(:factor, :string, null: false)
      add(:loading, :float, null: false)

      timestamps()
    end
  end
end
