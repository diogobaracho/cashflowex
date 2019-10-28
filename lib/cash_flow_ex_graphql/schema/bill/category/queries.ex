defmodule CashFlowExGraphQL.Schema.Category.Queries do
  use CashFlowExGraphQL.Helpers.GqlSchemaSuite

  object :category_queries do
    field :bill_categories, type: list_of(:bill_categories) do
      resolve(&Resolvers.BillCategoriesResolver.all/2)
    end
  end
end
