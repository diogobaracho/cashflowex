defmodule CashFlowExWeb.Health.PlugTest do
  use CashFlowExWeb.ConnCase

  test "GET /health", %{conn: conn} do
    conn = get(conn, "/health")

    # credo:disable-for-next-line CredoEnvvar.Check.Warning.EnvironmentVariablesAtCompileTime
    version = Application.get_env(:cash_flow_ex, :version)

    assert json_response(conn, 200) == %{
             "status" => "ok",
             "version" => version
           }
  end
end
