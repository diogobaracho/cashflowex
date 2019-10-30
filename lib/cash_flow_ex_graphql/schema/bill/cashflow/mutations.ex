defmodule CashFlowExGraphQL.Schema.Cashflow.Mutations do
  use CashFlowExGraphQL.Helpers.GqlSchemaSuite

  object :bill_cashflow_mutations do
    field :create_bill_cashflow, type: :bill_cashflows do
      arg(:title, :string)
      arg(:description, non_null(:string))
      arg(:transaction_date, non_null(:string))
      arg(:transation_type, non_null(:integer))
      arg(:is_consolidated, non_null(:boolean))
      arg(:amount, non_null(:float))
      arg(:bill_account_id, non_null(:id))

      resolve(&Resolvers.CashflowResolver.create/2)
    end

    field :update_bill_cashflow, type: :bill_cashflows do
      arg(:title, :string)
      arg(:description, non_null(:string))
      arg(:transaction_date, non_null(:string))
      arg(:transation_type, non_null(:integer))
      arg(:is_consolidated, non_null(:boolean))
      arg(:amount, non_null(:float))

      resolve(&Resolvers.CashflowResolver.update/2)
    end

    field :delete_bill_cashflow, type: :bill_cashflows do
      arg(:id, non_null(:id))
      resolve(&Resolvers.CashflowResolver.delete/2)
    end
  end
end
