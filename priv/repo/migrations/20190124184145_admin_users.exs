defmodule Misurd.Repo.Migrations.AdminUsers do
  use Ecto.Migration

  def up do
    drop_if_exists(table(:admin_users))

    create_if_not_exists table(:admin_users) do
      add(:user_login, :string)
      # virtual fields are NOT persisted to the database
      add(:password, :string, virtual: true)
      add(:password_hash, :string)
      add(:email, :string)
      add(:role_id, :integer)
      add(:role_name, :string)
      add(:group_id, :integer, default: 0)
      add(:prefix, :string)
      add(:firstname, :string)
      add(:middlename, :string)
      add(:lastname, :string)
      add(:suffix, :string)
      add(:taxvat, :integer)

      timestamps(type: :utc_datetime)
    end

    create(index(:admin_users, [:email]))
    create(index(:admin_users, [:user_login]))

    alter table(:admin_users) do
      modify(:inserted_at, :timestamp, default: fragment("NOW()"))
      modify(:updated_at, :timestamp, default: fragment("NOW()"))
    end
  end
end
