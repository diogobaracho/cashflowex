defmodule CashFlowExGraphQL do
  def document_providers(_) do
    [Absinthe.Plug.DocumentProvider.Default, CashFlowExGraphQL.CompiledQueries]
  end
end
