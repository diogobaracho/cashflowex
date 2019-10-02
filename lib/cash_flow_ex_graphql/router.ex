defmodule CashFlowExGraphQL.Router do
  use Plug.Router

  @absinthe_configuration [
    document_providers: {CashFlowExGraphQL, :document_providers},
    json_codec: Jason,
    schema: CashFlowExGraphQL.Schema
  ]

  plug(CashFlowExGraphQL.Plugs.Context)

  plug(:match)
  plug(:dispatch)

  forward("/graphql",
    to: Absinthe.Plug,
    init_opts: @absinthe_configuration
  )

  forward("/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [interface: :playground] ++ @absinthe_configuration
  )

  match(_, do: conn)
end
