defmodule CashFlowEx.BillCategory do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias CashFlowEx.Repo

  schema "bill_categories" do
    field(:title, :string)
    field(:description, :string)
    field(:parent_id, :integer)
    field(:path, :string)
    field(:is_root, :boolean)
    field(:position, :integer)
    field(:level, :integer)
    field(:children, :string)
    field(:is_active, :boolean)
  end

  def changeset(bill_category, params \\ %{}) do
    bill_category
    |> cast(params, [
      :title,
      :description,
      :parent_id,
      :path,
      :is_root,
      :position,
      :level,
      :children,
      :is_active
    ])
    |> validate_required([:title, :description])
  end
end
