defmodule Misurd.Repo.Migrations.BillAccountPlans do
  use Ecto.Migration

  def up do
    drop_if_exists(table(:bill_account_plans))

    create_if_not_exists table(:bill_account_plans) do
      add(:title, :string)
      add(:transaction_type, :integer)
      add(:recurrence, :string)
      add(:amount, :float)

      add(:user_id, references(:users, on_delete: :delete_all))
      add(:bill_account_id, references(:bill_accounts, on_delete: :delete_all))

      timestamps(type: :utc_datetime)
    end

    alter table(:bill_account_plans) do
      modify(:inserted_at, :timestamp, default: fragment("NOW()"))
      modify(:updated_at, :timestamp, default: fragment("NOW()"))
    end
  end
end
