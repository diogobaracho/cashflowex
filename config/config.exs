import Config

version = Mix.Project.config()[:version]

config :cash_flow_ex,
  ecto_repos: [CashFlowEx.Repo],
  version: version

config :phoenix, :json_library, Jason

config :cash_flow_ex, CashFlowExWeb.Endpoint,
  pubsub: [name: CashFlowEx.PubSub, adapter: Phoenix.PubSub.PG2],
  render_errors: [view: CashFlowExWeb.Errors.View, accepts: ~w(html json)]

config :cash_flow_ex, CashFlowEx.Repo, start_apps_before_migration: [:ssl]

config :cash_flow_ex, Corsica, allow_headers: :all

config :cash_flow_ex, CashFlowEx.Gettext, default_locale: "en"

config :cash_flow_ex, CashFlowExWeb.ContentSecurityPolicy, allow_unsafe_scripts: false

# Import environment configuration
import_config "#{Mix.env()}.exs"
