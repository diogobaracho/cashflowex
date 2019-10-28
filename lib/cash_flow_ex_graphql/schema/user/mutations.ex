defmodule CashFlowExGraphQL.Schema.User.Mutations do
  use CashFlowExGraphQL.Helpers.GqlSchemaSuite

  # alias CashFlowExGraphQL.Schema.{
  #   User
  # }

  object :user_mutations do

    # import_types(User.Types)

    field :create_user, type: :users do
      arg(:user_login, non_null(:string))
      arg(:password, non_null(:string))
      arg(:email, non_null(:string))
      arg(:role_id, :integer)
      arg(:role_name, :string)
      arg(:group_id, :integer)
      arg(:prefix, :string)
      arg(:firstname, :string)
      arg(:middlename, :string)
      arg(:lastname, :string)
      arg(:suffix, :string)
      arg(:dob, :string)
      arg(:gender, :integer)
      arg(:taxvat, non_null(:string))
      arg(:celphone, :string)
      arg(:phone, :string)
      arg(:is_subscribed, :string)

      resolve(&Resolvers.UserResolver.create/2)
    end

    field :update_user, type: :users do
      arg(:id, non_null(:id))
      arg(:user, :update_user_params)

      resolve(&Resolvers.UserResolver.update/2)
    end

    field :delete_user, type: :users do
      arg(:id, non_null(:id))
      resolve(&Resolvers.UserResolver.delete/2)
    end
  end
end
