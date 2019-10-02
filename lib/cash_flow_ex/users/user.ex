defmodule CashFlowEx.User do
  use Ecto.Schema
  import Ecto.Changeset

  import Ecto.Query, warn: false
  alias CashFlowEx.Repo
  alias CashFlowEx.{UsersAddresse, Event, User}

  schema "users" do
    field(:user_login, :string)
    # virtual fields are NOT persisted to the database
    field(:password, :string, virtual: true)
    field(:password_hash, :string)
    field(:email, :string)
    field(:role_id, :integer)
    field(:role_name, :string)
    field(:group_id, :integer, default: 0)
    field(:prefix, :string)
    field(:firstname, :string)
    field(:middlename, :string)
    field(:lastname, :string)
    field(:suffix, :string)
    field(:default_billing, :string)
    field(:default_shipping, :string)
    field(:dob, :utc_datetime)
    field(:gender, :integer)
    field(:taxvat, :string)
    field(:celphone, :string)
    field(:phone, :string)
    field(:is_subscribed, :boolean)
    has_many(:users_addresses, UsersAddresse, foreign_key: :user_id)
    # many_to_many :events, Event, join_through: "events_users", on_replace: :delete
    timestamps()
  end

  @fields ~w(
    user_login
    password
    email
    role_id
    role_name
    group_id
    prefix
    firstname
    middlename
    lastname
    suffix
    dob
    gender
    taxvat
    celphone
    phone
    is_subscribed
    )

  def changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, @fields)
    |> validate_required([:user_login, :email, :taxvat])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, downcase: true)
    |> unique_constraint(:user_login, downcase: true)
    |> unique_constraint(:taxvat)
  end
end
