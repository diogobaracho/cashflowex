defmodule CashFlowEx.Users do
  import Ecto.Query, warn: false
  alias CashFlowEx.Repo
  alias CashFlowEx.User

  def get!(id), do: Repo.get!(User, id)

  def list do
    # , preload: [:users_addresses,:events]
    Repo.all(from(p in User))
  end

  def get_by_id(id), do: Repo.get_by(User, %{id: id})

  def get_by_email(email), do: Repo.get_by(User, %{email: email})

  def create(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete(%User{} = user) do
    Repo.delete(user)
  end

  def change(%User{} = user) do
    User.changeset(user, %{})
  end
end
