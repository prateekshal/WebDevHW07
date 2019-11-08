use Mix.Config

# Configure your database
config :hw07, Hw07.Repo,
  username: "hw07",
  password: "hw07@12345",
  database: "hw07_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hw07, Hw07Web.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
