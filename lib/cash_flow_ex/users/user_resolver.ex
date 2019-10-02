defmodule CashFlowEx.Resolvers.UserResolver do
  alias CashFlowEx.Users

  def me(_, _, _) do
    {:ok, Users.list()}
  end

  def all(_args, _info) do
    {:ok, Users.list()}
  end

  def find_by_email(%{email: email}, _info) do
    case Users.get_by_email(email) do
      nil -> {:error, "user email #{email} not found"}
      user -> {:ok, user}
    end
  end

  def find_by_id(%{id: id}, _info) do
    case Users.get_by_id(id) do
      nil -> {:error, "user id #{id} not found"}
      user -> {:ok, user}
    end
  end

  def create(args, _info) do
    Users.create(args)
  end

  def update(%{id: id, user: user_params}, _info) do
    case find_by_id(%{id: id}, _info) do
      {:ok, user} -> user |> Users.update(user_params)
      {:error, _} -> {:error, "user id #{id} not found"}
    end
  end

  def delete(%{id: id}, _info) do
    case find_by_id(%{id: id}, _info) do
      {:ok, user} -> user |> Users.delete()
      {:error, _} -> {:error, "user id #{id} not found"}
    end
  end

  def login(_, %{token: token}, _) do
    # case Accounts.authenticate_user(token) do
    #   {:ok, user} -> {:ok, user}
    #   _ -> {:error, :unauthorized}
    # end

    {:ok, %{id: 1}}
  end

  def logout(_, _, _), do: {:ok, true}

  # def roles_for_user(user, _, _) do
  #   {:ok, Accounts.get_user_roles(user)}
  # end

  # def me(_, _, %{context: %{current_user: current_user}}) do
  #   {:ok, current_user}
  # end

  # def me(_, _, _) do
  #   {:ok, nil}
  # end

  # def last_update(_, _, _) do
  #   {:ok, Accounts.last_update()}
  # end
end
