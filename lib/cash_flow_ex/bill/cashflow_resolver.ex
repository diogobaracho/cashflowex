defmodule CashFlowEx.Resolvers.CashflowResolver do
  alias CashFlowEx.Cashflows

  def all(_args, _info) do
    {:ok, Cashflows.list()}
  end

  def find_by_id(%{id: id}, _info) do
    case Cashflows.get_by_id(id) do
      nil -> {:error, "id #{id} not found"}
      bill_cashflow -> {:ok, bill_cashflow}
    end
  end

  def create(args, _info) do
    Cashflows.create(args)
  end

  def update(%{id: id, cashflow: params}, _info) do
    case find_by_id(%{id: id}, _info) do
      {:ok, cashflow} -> cashflow |> Cashflows.update(params)
      {:error, _} -> {:error, "id #{id} not found"}
    end
  end

  def delete(%{id: id}, _info) do
    case find_by_id(%{id: id}, _info) do
      {:ok, bill_cashflow} -> bill_cashflow |> Cashflows.delete()
      {:error, _} -> {:error, "id #{id} not found"}
    end
  end
end
