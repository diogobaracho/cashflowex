defmodule CashFlowExGraphQL.Schema do
  use Absinthe.Schema
  use CashFlowExGraphQL.Helpers.GqlSchemaSuite

  import_types(Absinthe.Type.Custom)

  alias CashFlowExGraphQL.Schema.{
    Account,
    Cashflow,
    User
  }

  # Account
  import_types(Account.Queries)
  import_types(Account.Types)
  import_types(Account.Mutations)

  # Cashflow
  import_types(Cashflow.Queries)
  import_types(Cashflow.Types)
  import_types(Cashflow.Mutations)

  # User
  import_types(User.Types)
  import_types(User.Mutations)

  query do
    @desc "account queries"
    import_fields(:account_queries)

    @desc "cashflow queries"
    import_fields(:cashflow_queries)

    @desc "user queries"
    field :users, type: list_of(:users) do
      resolve(&Resolvers.UserResolver.all/2)
    end
  end

  mutation do
    # user
    import_fields(:user_mutations)

    # billing
    import_fields(:bill_account_mutations)
    import_fields(:bill_cashflow_mutations)
  end

  def context(context) do
    Map.put(
      context,
      :loader,
      Dataloader.add_source(Dataloader.new(), Repo, Dataloader.Ecto.new(Repo))
    )
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
