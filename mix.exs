defmodule CashFlowEx.Mixfile do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      app: :cash_flow_ex,
      version: @version,
      elixir: "~> 1.7",
      erlang: "~> 22.0",
      elixirc_paths: elixirc_paths(Mix.env()),
      test_paths: ["test"],
      test_pattern: "**/*_test.exs",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {CashFlowEx.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end

  defp deps do
    [
      # HTTP server
      {:plug_cowboy, "~> 2.1"},
      {:plug_canonical_host, "~> 1.0"},
      {:corsica, "~> 1.1"},

      # Phoenix
      {:phoenix, "~> 1.4.10"},
      {:phoenix_html, "~> 2.13.3"},
      {:phoenix_ecto, "~> 4.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:jason, "~> 1.1"},

      # GraphQL
      {:absinthe, "~> 1.4"},
      {:absinthe_plug, "~> 1.4"},
      {:absinthe_relay, "~> 1.4"},
      {:dataloader, "~> 1.0"},
      {:absinthe_error_payload, "~> 1.0"},

      # Database
      {:ecto_sql, "~> 3.2"},
      {:postgrex, "~> 0.15"},

      # Authentication
      {:basic_auth, "~> 2.2"},

      # Releases
      {:distillery, "~> 2.1"},

      # Doc
      {:ex_doc, "~> 0.21.2"},

      # Translations
      {:gettext, "~> 0.16"},

      # Code quality
      {:pre_commit, "~> 0.3.4", only: :dev},

      # Linting
      {:credo, "~> 1.1", only: [:dev, :test], override: true},
      {:credo_envvar, "~> 0.1", only: [:dev, :test], runtime: false},
      {:credo_naming, "~> 0.4", only: [:dev, :test], runtime: false},

      # Security check
      {:sobelow, "~> 0.8", only: [:dev, :test], runtime: true},

      # Test factories
      {:ex_machina, "~> 2.3", only: :test},
      {:faker, "~> 0.12", only: :test},

      # Test coverage
      {:excoveralls, "~> 0.11", only: :test}
    ]
  end
end
