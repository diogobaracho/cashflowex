defmodule CashFlowEx.Application do
  @moduledoc """
  Main entry point of the app
  """

  use Application

  def start(_type, _args) do
    children = [
      CashFlowEx.Repo,
      CashFlowExWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: CashFlowEx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    CashFlowExWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
