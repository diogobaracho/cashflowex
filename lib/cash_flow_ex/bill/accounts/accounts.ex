defmodule CashFlowEx.BillAccounts do
  import Ecto.Query, warn: false
  alias CashFlowEx.Repo
  alias CashFlowEx.BillAccount

  def get!(id), do: Repo.get!(BillAccount, id)

  def get_by_id(id), do: Repo.get_by(BillAccount, %{id: id})

  def list do
    Repo.all(from(p in BillAccount, preload: [:users]))
  end

  def create(attrs \\ %{}) do
    %BillAccount{}
    |> BillAccount.changeset(attrs)
    |> Repo.insert()
  end

  def update(%BillAccount{} = bill_account, attrs) do
    bill_account
    |> BillAccount.changeset(attrs)
    |> Repo.update()
  end

  def delete(%BillAccount{} = bill_account) do
    Repo.delete(bill_account)
  end

  def change(%BillAccount{} = bill_account) do
    BillAccount.changeset(bill_account, %{})
  end
end
