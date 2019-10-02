defmodule Misurd.Repo.Migrations.Users do
  use Ecto.Migration

  def up do
    drop_if_exists(table(:users))

    create_if_not_exists table(:users) do
      add(:misurd_id, :id)
      add(:user_login, :string)
      # virtual fields are NOT persisted to the database
      add(:password, :string, virtual: true)
      add(:password_hash, :string)
      add(:email, :string)
      add(:role_id, :id)
      add(:role_name, :string)
      add(:group_id, :id, default: 0)
      add(:prefix, :string)
      add(:firstname, :string)
      add(:middlename, :string)
      add(:lastname, :string)
      add(:suffix, :string)
      add(:default_billing, :string)
      add(:default_shipping, :string)
      add(:dob, :utc_datetime)
      add(:gender, :integer)
      add(:taxvat, :string)
      add(:celphone, :string)
      add(:phone, :string)
      add(:is_subscribed, :boolean)

      timestamps(type: :utc_datetime)
    end

    create(index(:users, [:user_login]))
    create(index(:users, [:email]))

    alter table(:users) do
      modify(:inserted_at, :timestamp, default: fragment("NOW()"))
      modify(:updated_at, :timestamp, default: fragment("NOW()"))
    end
  end
end
