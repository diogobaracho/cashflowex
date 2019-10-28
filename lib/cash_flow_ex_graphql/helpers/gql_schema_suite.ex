defmodule CashFlowExGraphQL.Helpers.GqlSchemaSuite do
  @moduledoc """
  helper for reduce boilerplate import/use/alias in absinthe schema
  """

  defmacro __using__(_opts) do
    quote do
      use Absinthe.Schema.Notation

      # alias CashFlowEx.Middleware, as: Middlewares
      alias CashFlowEx.Resolvers, as: Resolvers
    end
  end
end
