# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :aua_demo,
  ecto_repos: [AuaDemo.Repo]

# Configures the endpoint
config :aua_demo, AuaDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Zgkk9OmWuMWy1i1Cx/aXBhzdPUyVWR0Bji1Jd0FUk5wSvRE+ELF2Ct0Rngx5mAQv",
  render_errors: [view: AuaDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AuaDemo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
