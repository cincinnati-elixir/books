# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :books,
  ecto_repos: [Books.Repo]

# Configures the endpoint
config :books, Books.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+0llW2c3nQZCEFgkdbbss2dEDAD/swVtSsHE2ELhmIKVNaJYU2fNEo4lwUK2jrkG",
  render_errors: [view: Books.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Books.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
