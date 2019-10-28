defmodule CashFlowExGraphQL.Schema.Cashflow.Types do
  use CashFlowExGraphQL.Helpers.GqlSchemaSuite

  object :cashflow do
    field(:id, :id)
    field(:name, :string)
  end

  object :bill_cashflows do
    field(:title, :string)
    field(:description, :string)
    field(:transaction_date, :datetime)
    field(:transation_type, :integer)
    field(:is_consolidated, :boolean)
    field(:amount, :float)
  end
end
