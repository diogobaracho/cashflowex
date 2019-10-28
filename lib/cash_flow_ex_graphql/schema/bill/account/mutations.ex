defmodule CashFlowExGraphQL.Schema.Account.Mutations do

  use CashFlowExGraphQL.Helpers.GqlSchemaSuite

  object :bill_account_mutations do
    field :create_bill_account, type: :bill_accounts do
      arg(:title, non_null(:string))
      arg(:summary, :string)
      arg(:is_active, non_null(:boolean))
      arg(:initial_value, non_null(:float))
      arg(:user_id, non_null(:id))

      resolve(&Resolvers.BillAccountResolver.create/2)
    end
  end
end
