defmodule CashFlowExGraphQL.Schema.Bill.Cashflow do
  use Absinthe.Schema.Notation

  object :answer do
    field(:id, :id)
    field(:name, :string)
  end
end
