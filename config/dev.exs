import Config

config :cash_flow_ex, CashFlowExWeb.Endpoint,
  http: [
    port: System.get_env("PORT") || 4006,
    protocol_options: [max_keepalive: 5_000_000]
  ],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  server: true,
  watchers: []

# config :cash_flow_ex, CashFlowExWeb.ContentSecurityPolicy, allow_unsafe_scripts: true

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

# Configure your database
config :cash_flow_ex, CashFlowEx.Repo,
  database: "cashflowex_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"
