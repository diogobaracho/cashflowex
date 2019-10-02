defmodule CashFlowEx.Resolvers.BillCategoriesResolver do
  alias CashFlowEx.BillCategories

  def all(_args, _info) do
    {:ok, BillCategories.list()}
  end

  def find_by_id(%{id: id}, _info) do
    case BillCategories.get_by_id(id) do
      nil -> {:error, "id #{id} not found"}
      bill_categories -> {:ok, bill_categories}
    end
  end

  def create(args, _info) do
    BillCategories.create(args)
  end

  def update(%{id: id, category: params}, _info) do
    case find_by_id(%{id: id}, _info) do
      {:ok, category} -> category |> BillCategories.update(params)
      {:error, _} -> {:error, "id #{id} not found"}
    end
  end

  def delete(%{id: id}, _info) do
    case find_by_id(%{id: id}, _info) do
      {:ok, bill_categories} -> bill_categories |> BillCategories.delete()
      {:error, _} -> {:error, "id #{id} not found"}
    end
  end
end
