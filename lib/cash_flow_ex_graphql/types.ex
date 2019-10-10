defmodule CashFlowExGraphQL.Web.Schema.Types do
  use Absinthe.Schema.Notation

  #  USERS --------------------------
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

    # field(:users_addresses, list_of(:users_addresses), resolve: assoc(:users_addresses))
    # field(:users_events, list_of(:events), resolve: assoc(:events))
  end

  input_object :update_user_params do
    field(:firstname, :string)
    field(:email, :string)
    field(:id, :id)
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

  #  END OF USERS --------------------------

  object :bill_accounts do
    field(:title, :string)
    field(:summary, :string)
    field(:is_active, :boolean)
    field(:initial_value, :float)

    # field(:users, :users, resolve: assoc(:users))
  end

  object :bill_categories do
    field(:title, :string)
    field(:description, :string)
    field(:parent_id, :integer)
    field(:path, :string)
    field(:is_root, :boolean)
    field(:position, :integer)
    field(:level, :integer)
    field(:children, :string)
    field(:is_active, :boolean)
  end

  object :bill_cashflows do
    field(:title, :string)
    field(:description, :string)
    field(:transaction_date, :datetime)
    field(:transation_type, :integer)
    field(:is_consolidated, :boolean)
    field(:amount, :float)
  end
end
