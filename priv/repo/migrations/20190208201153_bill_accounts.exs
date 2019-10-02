defmodule Misurd.Repo.Migrations.BillAccounts do
  use Ecto.Migration

  def up do
    drop_if_exists(table(:bill_accounts))

    create_if_not_exists table(:bill_accounts) do
      add(:title, :string)
      add(:summary, :string)
      add(:is_active, :boolean)
      add(:initial_value, :float)

      add(:user_id, references(:users, on_delete: :nothing))

      timestamps(type: :utc_datetime)
    end

    alter table(:bill_accounts) do
      modify(:inserted_at, :timestamp, default: fragment("NOW()"))
      modify(:updated_at, :timestamp, default: fragment("NOW()"))
    end
  end
end
