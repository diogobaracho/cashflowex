defmodule CashFlowEx.Resolvers.BillAccountResolver do
  alias CashFlowEx.BillAccounts

  def all(_args, _info) do
    {:ok, BillAccounts.list()}
  end

  def find_by_id(%{id: id}, _info) do
    case BillAccounts.get_by_id(id) do
      nil -> {:error, "id #{id} not found"}
      bill_account -> {:ok, bill_account}
    end
  end

  def create(args, _info) do
    BillAccounts.create(args)
  end

  def update(%{id: id, user: user_params}, _info) do
    case find_by_id(%{id: id}, _info) do
      {:ok, user} -> user |> BillAccounts.update(user_params)
      {:error, _} -> {:error, "id #{id} not found"}
    end
  end

  def delete(%{id: id}, _info) do
    case find_by_id(%{id: id}, _info) do
      {:ok, bill_account} -> bill_account |> BillAccounts.delete()
      {:error, _} -> {:error, "id #{id} not found"}
    end
  end
end
