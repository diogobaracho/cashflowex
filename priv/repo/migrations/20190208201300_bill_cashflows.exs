defmodule Misurd.Repo.Migrations.BillCashflows do
  use Ecto.Migration

  def up do
    drop_if_exists(table(:bill_cashflows))

    create_if_not_exists table(:bill_cashflows) do
      add(:title, :string)
      add(:description, :string)
      add(:transaction_date, :utc_datetime)
      add(:transaction_time_zone, :string)
      # despesa:1, receita:2, transferencia:3
      add(:transation_type, :integer, default: 0)
      # consolidada
      add(:is_consolidated, :boolean, default: false)
      add(:amount, :float)

      add(:user_id, references(:users, on_delete: :delete_all))
      add(:bill_account_id, references(:bill_accounts, on_delete: :delete_all))

      timestamps(type: :utc_datetime)
    end

    alter table(:bill_cashflows) do
      modify(:inserted_at, :timestamp, default: fragment("NOW()"))
      modify(:updated_at, :timestamp, default: fragment("NOW()"))
    end
  end
end
