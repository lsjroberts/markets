defmodule Server.Repo.Migrations.CreateOrders do
  use Ecto.Migration
  # SideEnum.create_type()

  def change do
    create table(:orders) do
      add(:exchange_id, references(:exchanges, on_delete: :delete_all))

      add(:shares, :integer, null: false)
      add(:fulfilled, :integer, null: false)
      # add(:side, Side.type())
      add(:side, :string, null: false)

      timestamps()
    end
  end
end
