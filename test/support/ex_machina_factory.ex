# credo:disable-for-this-file
defmodule CashFlowEx.Helpers.ExMachinaFactory do
  @moduledoc false

  use ExMachina.Ecto, repo: PlurallReports.Repo

  defp merge_attributes(attr_list) do
    Enum.reduce(attr_list, fn attrs, acc -> Map.merge(acc, attrs) end)
  end

  def user_factory do
    %CashFlowEx.User{
      user_login: sequence(:user_login, &"#{&1 + 1}"),
      password: "password",
      password_hash: "password",
      email: sequence(:email, &"agent.smith.#{&1}@example.com"),
      role_id: 1,
      role_name: "Role X",
      group_id: 1,
      prefix: "",
      firstname: sequence("Agent "),
      middlename: "",
      lastname: sequence("Smith "),
      suffix: "",
      default_billing: "",
      default_shipping: "",
      dob: sequence(:dob, fn _ -> DateTime.utc_now() end),
      gender: 1,
      taxvat: "",
      celphone: "",
      phone: "",
      is_subscribed: 1
    }
  end

  @doc ~S"""
  create_user factory
  """
  def create_user(attrs \\ %{})

  def create_user(attrs) when is_map(attrs) do
    insert(:user, attrs)
  end

  def create_user(attr_list) when is_list(attr_list) do
    attr_list
    |> merge_attributes
    |> create_user()
  end
end
