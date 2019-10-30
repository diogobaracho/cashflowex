defmodule CashFlowEx.Test.Query.Bill.Clashflows do
  # use CashFlowEx.TestTools

  use CashFlowEx.ConnCase

  import CashFlowEx.Helpers.ExMachinaFactory

  # alias Helper.ORM
  alias CashFlowEx.Billing

  describe "[user]" do
    test "list", %{conn: conn} do
      user = create_user()
      IO.inspect(user, label: "created user!!")
    end
  end

  # setup do
  #   {:ok, user} = db_insert(:user)
  #   guest_conn = simu_conn(:guest)
  #   user_conn = simu_conn(:user, user)

  #   valid_attrs = %{
  #     amount: 10.24,
  #     payment_usage: "donate",
  #     payment_method: "alipay"
  #   }

  #   {:ok, ~m(guest_conn user_conn user valid_attrs)a}
  # end

  # describe "[biling basic]" do
  #   @query """
  #   query($filter: PagedFilter!) {
  #     pagedBillRecords(filter: $filter) {
  #       entries {
  #         id
  #         state
  #         amount
  #         hashId
  #         paymentUsage
  #         paymentMethod
  #       }
  #       totalPages
  #       totalCount
  #       pageSize
  #       pageNumber
  #     }
  #   }
  #   """
  #   test "login user can get it's own billing records ", ~m(user_conn user valid_attrs)a do
  #     {:ok, _record} = Billing.create_record(user, valid_attrs)

  #     variables = %{filter: %{page: 1, size: 20}}
  #     results = user_conn |> query_result(@query, variables, "pagedBillRecords")

  #     assert results |> is_valid_pagination?
  #   end
  # end
end
