defmodule CashFlowExGraphQL.Schema.Account.Queries do

  use CashFlowExGraphQL.Helpers.GqlSchemaSuite

  alias CashFlowEx.Resolvers

  object :account_queries do
    field :bill_accounts, type: list_of(:bill_accounts) do
      resolve(&Resolvers.BillAccountResolver.all/2)
    end
  end
end
