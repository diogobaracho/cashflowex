defmodule CashFlowExWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :cash_flow_ex

  socket("/socket", CashFlowExWeb.Socket)

  plug(CashFlowExWeb.Health.Plug)
  plug(:canonical_host)
  plug(:force_ssl)
  plug(:cors)
  plug(:basic_auth)

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug(Plug.Static,
    at: "/",
    from: :cash_flow_ex,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)
  )

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket("/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket)

    plug(Phoenix.LiveReloader)
    plug(Phoenix.CodeReloader)
  end

  plug(Plug.RequestId)
  plug(Plug.Telemetry, event_prefix: [:phoenix, :endpoint])

  plug(
    Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)

  plug(:session)
  plug(:halt_if_sent)
  plug(CashFlowExWeb.Router)

  @doc """
  Callback invoked for dynamically configuring the endpoint.

  It receives the endpoint configuration and checks if
  configuration should be loaded from the system environment.
  """
  def init(_key, config) do
    if config[:load_from_system_env] do
      port =
        Application.get_env(:cash_flow_ex, CashFlowExWeb.Endpoint)[:http][:port] ||
          raise "expected the PORT environment variable to be set"

      {:ok, Keyword.put(config, :http, [:inet6, port: port])}
    else
      {:ok, config}
    end
  end

  defp canonical_host(conn, _opts) do
    opts =
      PlugCanonicalHost.init(canonical_host: Application.get_env(:cash_flow_ex, :canonical_host))

    PlugCanonicalHost.call(conn, opts)
  end

  defp force_ssl(conn, _opts) do
    if Application.get_env(:cash_flow_ex, :force_ssl) do
      opts = Plug.SSL.init(rewrite_on: [:x_forwarded_proto])

      Plug.SSL.call(conn, opts)
    else
      conn
    end
  end

  defp cors(conn, _opts) do
    opts = Corsica.init(Application.get_env(:cash_flow_ex, Corsica))

    Corsica.call(conn, opts)
  end

  defp basic_auth(conn, _opts) do
    basic_auth_config = Application.get_env(:cash_flow_ex, :basic_auth)

    if basic_auth_config[:username] do
      opts = BasicAuth.init(use_config: {:cash_flow_ex, :basic_auth})

      BasicAuth.call(conn, opts)
    else
      conn
    end
  end

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  defp session(conn, _opts) do
    opts =
      Plug.Session.init(
        store: :cookie,
        key: Application.get_env(:cash_flow_ex, CashFlowExWeb.Endpoint)[:session_key],
        signing_salt: Application.get_env(:cash_flow_ex, CashFlowExWeb.Endpoint)[:signing_salt]
      )

    Plug.Session.call(conn, opts)
  end

  # Splitting the Web and GraphQL router in separate modules has a negative
  # side effect: Phoenix.Router does not check the Plug.Conn state and tries to
  # match the route even if it was already handled/sent by Absinthe.Plug.
  defp halt_if_sent(%{state: :sent, halted: false} = conn, _opts), do: halt(conn)
  defp halt_if_sent(conn, _opts), do: conn
end
