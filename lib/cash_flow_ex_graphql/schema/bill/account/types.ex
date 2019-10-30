defmodule CashFlowExGraphQL.Schema.Account.Types do
  use CashFlowExGraphQL.Helpers.GqlSchemaSuite

  object :account do
    field(:id, :id)
    field(:name, :string)
  end

  object :bill_accounts do
    field(:id, :id)
    field(:title, :string)
    field(:summary, :string)
    field(:is_active, :boolean)
    field(:initial_value, :float)

    # field(:users, :users, resolve: assoc(:users))
  end
end
