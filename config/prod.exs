import Config

config :cash_flow_ex, CashFlowExWeb.Endpoint,
  load_from_system_env: true,
  # Needed for Phoenix 1.2 and 1.4. Doesn't hurt for 1.3.
  http: [port: {:system, "PORT"}],
  # Without this line, your app will not start the web server!
  server: true,
  secret_key_base: "${SECRET_KEY_BASE}",
  url: [host: "${APP_NAME}.gigalixirapp.com", port: 443],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  level: :info,
  metadata: ~w(request_id)a

# Configure your database
config :cash_flow_ex, CashFlowEx.Repo,
  url: "${DATABASE_URL}",
  database: "",
  ssl: true,
  # Free tier db only allows 4 connections. Rolling deploys need pool_size*(n+1) connections where n is the number of app replicas.
  pool_size: 2
