defmodule CashFlowEx.UsersAddresse do
  use Ecto.Schema
  import Ecto.Changeset

  import Ecto.Query, warn: false

  alias CashFlowEx.{User, UsersAddresse}

  schema "users_addresses" do
    field(:street, :string)
    field(:number, :string)
    field(:type, :string)
    belongs_to(:user, User, foreign_key: :user_id)
  end

  def changeset(%UsersAddresse{} = address, attrs \\ %{}) do
    address
    |> cast(attrs, [:street, :user_id])
    |> validate_required([:street])
  end
end
