defmodule CashFlowExGraphQL.Schema.Cashflow.Queries do
  use CashFlowExGraphQL.Helpers.GqlSchemaSuite

  object :cashflow_queries do
    field :bill_cashflows, type: list_of(:bill_cashflows) do
      resolve(&Resolvers.CashflowResolver.all/2)
    end

    field :bill_cashflow, type: :bill_cashflows do
      arg(:id, non_null(:string))
      resolve(&Resolvers.CashflowResolver.find_by_id/2)
    end
  end
end
