defmodule CashFlowEx.Cashflow do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias CashFlowEx.{Cashflow, BillAccount}

  schema "bill_cashflows" do
    field(:title, :string)
    field(:description, :string)
    field(:transaction_date, :utc_datetime)
    field(:transation_type, :integer)
    field(:is_consolidated, :boolean)
    field(:amount, :float)

    belongs_to(:bill_accounts, BillAccount, foreign_key: :bill_account_id)
  end

  @fields ~w(
    title
    description
    transaction_date
    transation_type
    is_consolidated
    amount
    bill_account_id
  )

  def changeset(%Cashflow{} = cashflow, attrs \\ %{}) do
    cashflow
    |> cast(attrs, @fields)
  end
end
