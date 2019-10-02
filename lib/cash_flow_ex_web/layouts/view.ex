defmodule CashFlowExWeb.Layouts.View do
  use Phoenix.View, root: "lib/cash_flow_ex_web", path: "layouts/templates", namespace: CashFlowExWeb
  use Phoenix.HTML

  import Phoenix.Controller, only: [get_flash: 2]

  alias CashFlowExWeb.Router.Helpers, as: Routes
end
