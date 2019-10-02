defmodule CashFlowEx.BillCategories do
  import Ecto.Query, warn: false
  alias CashFlowEx.Repo
  alias CashFlowEx.BillCategory

  def get!(id), do: Repo.get!(BillCategory, id)

  def get_by_id(id), do: Repo.get_by(BillCategory, %{id: id})

  def list do
    # , preload: [:users]
    Repo.all(from(p in BillCategory))
  end

  def create(attrs \\ %{}) do
    %BillCategory{}
    |> BillCategory.changeset(attrs)
    |> Repo.insert()
  end

  def update(%BillCategory{} = bill_category, attrs) do
    bill_category
    |> BillCategory.changeset(attrs)
    |> Repo.update()
  end

  def delete(%BillCategory{} = bill_category) do
    Repo.delete(bill_category)
  end

  def change(%BillCategory{} = bill_category) do
    BillCategory.changeset(bill_category, %{})
  end
end
