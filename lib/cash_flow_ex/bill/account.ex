defmodule CashFlowEx.BillAccount do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias CashFlowEx.{BillAccount, User}

  schema "bill_accounts" do
    field(:title, :string)
    field(:summary, :string)
    field(:is_active, :boolean)
    field(:initial_value, :float)

    belongs_to(:users, User, foreign_key: :user_id)
  end

  @fields ~w(
    title
    summary
    is_active
    initial_value
    user_id
  )

  def changeset(%BillAccount{} = bill_account, attrs \\ %{}) do
    bill_account
    |> cast(attrs, @fields)
    |> validate_required([:title, :initial_value])
  end
end
