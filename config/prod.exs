import Config

config :cash_flow_ex, CashFlowExWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  level: :info,
  metadata: ~w(request_id)a

# Configure your database
config :cash_flow_ex, CashFlowEx.Repo,
  url: "${DATABASE_URL}",
  database: "",
  ssl: true,
  pool_size: 2
