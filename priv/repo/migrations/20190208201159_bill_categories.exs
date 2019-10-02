defmodule Misurd.Repo.Migrations.BillCategories do
  use Ecto.Migration

  def up do
    drop_if_exists(table(:bill_categories))

    create_if_not_exists table(:bill_categories) do
      add(:title, :string)
      add(:description, :string)
      add(:parent_id, :integer)
      add(:path, :string)
      add(:is_root, :boolean)
      add(:position, :integer)
      add(:level, :integer)
      add(:children, :string)
      add(:is_active, :boolean)

      timestamps(type: :utc_datetime)
    end

    alter table(:bill_categories) do
      modify(:inserted_at, :timestamp, default: fragment("NOW()"))
      modify(:updated_at, :timestamp, default: fragment("NOW()"))
    end
  end
end
