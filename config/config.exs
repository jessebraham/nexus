# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :nexus,
  ecto_repos: [Nexus.Repo]

# Configures the endpoint
config :nexus, NexusWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ld55JQ3xRcH1Ua9y6ZuaYx66dVSvOyx1N90YbJ3wzLpUSxc+NonqHUh6Eem6jh0C",
  render_errors: [view: NexusWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Nexus.PubSub,
  live_view: [signing_salt: "dt7suxPR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
