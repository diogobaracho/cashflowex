defmodule CashFlowEx.TestTools do
  @moduledoc """
  helper for reduce import mudules in test files
  """
  use ExUnit.CaseTemplate

  using do
    quote do
      use CashFlowExWeb.ConnCase, async: true

      # import CashFlowEx.Support.Factory
      # import CashFlowEx.Test.ConnSimulator
      # import CashFlowEx.Test.AssertHelper
      # import Ecto.Query, warn: false
      # import Helper.ErrorCode
      # import Helper.Utils, only: [camelize_map_key: 1, camelize_map_key: 2]

      # import ShortMaps
    end
  end
end
