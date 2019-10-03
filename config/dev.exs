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
  watchers: [],
  secret_key_base: "G0ieeRljoXGzSDPRrYc2q4ADyNHCwxNOkw7YpPNMa+JgP9iGgJKT4K96Bw/Mf/pd",
  session_key: "test",
  signing_salt: "qh+vmMHsOqcjKF3TSSIsghwt2go48m2+IQ+kMTOB3BrSysSr7D4a21uAtt4yp4wn"

config :cash_flow_ex, CashFlowExWeb.ContentSecurityPolicy, allow_unsafe_scripts: true

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

# Configure your database
config :cash_flow_ex, CashFlowEx.Repo,
  database: "cashflowex_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"
