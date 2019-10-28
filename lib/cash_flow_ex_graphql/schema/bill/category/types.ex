defmodule CashFlowExGraphQL.Schema.Category.Types do
  use CashFlowExGraphQL.Helpers.GqlSchemaSuite

  object :category do
    field(:id, :id)
    field(:name, :string)
  end

  object :bill_categories do
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
end
