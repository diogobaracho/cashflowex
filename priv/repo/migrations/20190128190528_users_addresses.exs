defmodule Misurd.Repo.Migrations.UsersAddress do
  use Ecto.Migration

  def up do
    drop_if_exists(table(:users_addresses))

    create_if_not_exists table(:users_addresses) do
      add(:street, :string)
      add(:number, :string)
      add(:type, :string)
      add(:region, :string)
      add(:region_code, :string)
      add(:country_id, :string)
      add(:postcode, :integer)
      add(:city, :string)
      add(:description, :string)

      add(:user_id, references(:users, on_delete: :delete_all))

      # timestamps(type: :utc_datetime)
      timestamps()
    end

    create(index(:users_addresses, [:user_id]))

    alter table(:users_addresses) do
      modify(:inserted_at, :timestamp, default: fragment("NOW()"))
      modify(:updated_at, :timestamp, default: fragment("NOW()"))
    end
  end
end
