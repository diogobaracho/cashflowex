defmodule CashFlowExGraphQL.Schema.User.Types do
  use CashFlowExGraphQL.Helpers.GqlSchemaSuite

  object :user do
    field(:id, :id)
    field(:name, :string)
  end

  object :users do
    field(:id, :id)
    field(:email, :string)
    field(:user_login, :string)
    field(:role_id, :integer)
    field(:role_name, :string)
    field(:unit_id, :integer)
    field(:unit_name, :string)
    field(:grade_id, :integer)
    field(:grade_name, :string)
    field(:class_id, :integer)
    field(:class_name, :string)
    field(:discipline_id, :integer)
    field(:discipline_name, :string)
    field(:group_id, :integer)
    field(:prefix, :string)
    field(:firstname, :string)
    field(:middlename, :string)
    field(:lastname, :string)
    field(:suffix, :string)
    field(:default_billing, :string)
    field(:default_shipping, :string)
    field(:dob, :string)
    field(:gender, :integer)
    field(:taxvat, :integer)
    field(:addresses, :string)
    field(:celphone, :string)
    field(:phone, :string)
    field(:is_subscribed, :boolean)
  end

  object :users_addresses do
    field(:id, :id)
    field(:street, :string)
    field(:number, :string)
    field(:type, :string)
    field(:region, :string)
    field(:region_code, :string)
    field(:country_id, :string)
    field(:postcode, :integer)
    field(:city, :string)
    field(:description, :string)

    # field(:users, :users, resolve: assoc(:users))
  end

  input_object :update_user_params do
    field(:firstname, :string)
    field(:email, :string)
    field(:id, :id)
  end
end
