defmodule CashFlowExWeb.Errors.View do
  use Phoenix.View,
    root: "lib/cash_flow_ex_web",
    path: "errors/templates",
    namespace: CashFlowExWeb

  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
