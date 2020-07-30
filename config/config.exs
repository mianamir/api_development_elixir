# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :api_proj,
  ecto_repos: [ApiProj.Repo]

# Configures the endpoint
config :api_proj, ApiProjWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ot0oN6l5dBrcFRmVqDey7PEOAElN7Oiq8Uj28EgJ6zV3uMJsZW8KCaE8kRPiPdaE",
  render_errors: [view: ApiProjWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ApiProj.PubSub,
  live_view: [signing_salt: "u4aTrCwQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# config :mime, :types, %{
#   "application/vnd.api+json" => ["json-api"]
# }

# config :phoenix, :format_encoders, %{
#   "json-api": Poison
# }

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

