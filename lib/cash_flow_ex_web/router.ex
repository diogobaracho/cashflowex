defmodule CashFlowExWeb.Router do
  use Phoenix.Router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :browser do
    plug(:accepts, ["html", "json"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(CashFlowExWeb.ContentSecurityPolicy)
    plug(:put_layout, {CashFlowExWeb.Layouts.View, :app})
  end

  scope "/", CashFlowExWeb do
    pipe_through(:browser)

    get("/", Home.Controller, :index, as: :home)
  end
end
