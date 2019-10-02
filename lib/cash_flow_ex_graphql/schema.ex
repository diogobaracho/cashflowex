defmodule CashFlowExGraphQL.Schema do
  use Absinthe.Schema

  alias CashFlowEx.Repo

  import_types(Absinthe.Type.Custom)
  import_types(CashFlowExGraphQL.Web.Schema.Types)

  query do

    field :users, type: list_of(:users) do
      resolve(&Resolvers.UserResolver.all/2)
    end

    # BILL -------------------------------------------------------#
    field :bill_accounts, type: list_of(:bill_accounts) do
      resolve(&Resolvers.BillAccountResolver.all/2)
    end

    field :bill_cashflows, type: list_of(:bill_cashflows) do
      resolve(&Resolvers.CashflowResolver.all/2)
    end

    field :bill_cashflow, type: :bill_cashflows do
      arg(:id, non_null(:string))
      resolve(&Resolvers.CashflowResolver.find_by_id/2)
    end

    field :bill_categories, type: list_of(:bill_categories) do
      resolve(&Resolvers.BillCategoriesResolver.all/2)
    end

    # END OF BILL ------------------------------------------------#
  end

  mutation do
    # field :login, :users do
    #   arg(:token, non_null(:string))
    #   resolve(&Resolvers.UserResolver.login/3)
    # end

    # field :logout, :boolean do
    #   resolve(&Resolvers.UserResolver.logout/3)
    # end

    # BILL -------------------------------------------------#
    # CASHFLOW
    field :create_bill_account, type: :bill_accounts do
      arg(:title, non_null(:string))
      arg(:summary, :string)
      arg(:is_active, non_null(:boolean))
      arg(:initial_value, non_null(:float))
      arg(:user_id, non_null(:id))

      resolve(&Resolvers.BillAccountResolver.create/2)
    end

    field :create_bill_cashflow, type: :bill_cashflows do
      arg(:title, :string)
      arg(:description, non_null(:string))
      arg(:transaction_date, non_null(:string))
      arg(:transation_type, non_null(:integer))
      arg(:is_consolidated, non_null(:boolean))
      arg(:amount, non_null(:float))
      arg(:bill_account_id, non_null(:id))

      resolve(&Resolvers.CashflowResolver.create/2)
    end

    field :update_bill_cashflow, type: :bill_cashflows do
      arg(:title, :string)
      arg(:description, non_null(:string))
      arg(:transaction_date, non_null(:string))
      arg(:transation_type, non_null(:integer))
      arg(:is_consolidated, non_null(:boolean))
      arg(:amount, non_null(:float))

      resolve(&Resolvers.CashflowResolver.update/2)
    end

    field :delete_bill_cashflow, type: :bill_cashflows do
      arg(:id, non_null(:id))
      resolve(&Resolvers.CashflowResolver.delete/2)
    end

    # END OF CASHFLOW

    # END OF BILL ---------------------------------------------#

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

  def context(context) do
    Map.put(context, :loader, Dataloader.add_source(Dataloader.new(), Repo, Dataloader.Ecto.new(Repo)))
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
