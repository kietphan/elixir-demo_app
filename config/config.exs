# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :love_time,
  ecto_repos: [LoveTime.Repo]

# Configures the endpoint
config :love_time, LoveTime.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/lMwc6JNTq4c/ANiwBG5EwrcVdJkc35QR2BII6evA8EUoNEguICaULy+ZjkNPV2t",
  render_errors: [view: LoveTime.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LoveTime.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
