defmodule CashFlowEx.Cashflows do
  import Ecto.Query, warn: false
  alias CashFlowEx.Repo
  alias CashFlowEx.Cashflow

  def get!(id), do: Repo.get!(Cashflow, id)

  def get_by_id(id), do: Repo.get_by(Cashflow, %{id: id})

  def list do
    Repo.all(from(p in Cashflow, preload: [:bill_accounts]))
  end

  def create(attrs \\ %{}) do
    %Cashflow{}
    |> Cashflow.changeset(attrs)
    |> Repo.insert()
  end

  def update(%Cashflow{} = cashflow, attrs) do
    cashflow
    |> Cashflow.changeset(attrs)
    |> Repo.update()
  end

  def delete(%Cashflow{} = cashflow) do
    Repo.delete(cashflow)
  end

  def change(%Cashflow{} = cashflow) do
    Cashflow.changeset(cashflow, %{})
  end
end
