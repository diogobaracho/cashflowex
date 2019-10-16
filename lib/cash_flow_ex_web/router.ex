defmodule CashFlowExWeb.Router do
  use Phoenix.Router

  @absinthe_configuration [
    document_providers: {CashFlowExGraphQL, :document_providers},
    json_codec: Jason,
    schema: CashFlowExGraphQL.Schema
  ]

  pipeline :api do
    plug(:accepts, ["json"])

    plug(CashFlowExGraphQL.Plugs.Context)
  end

  pipeline :browser do
    plug(:accepts, ["html", "json"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(CashFlowExWeb.ContentSecurityPolicy)
    plug(:put_layout, {CashFlowExWeb.Layouts.View, :app})
    # plug(:match)
    # plug(:dispatch)
  end

  scope "/", CashFlowExWeb do
    pipe_through(:browser)

    get("/api/status", Home.Controller, :index, as: :home)
  end

  scope "/" do
    pipe_through(:api)

    forward("/api", Absinthe.Plug, @absinthe_configuration)

    if Mix.env() != :prod,
      do: forward("/graphiql", Absinthe.Plug.GraphiQL, @absinthe_configuration)
  end
end
