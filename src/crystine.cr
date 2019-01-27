require "kemal"
require "sentry-run"

require "./helpers/*"
require "./db"

require "./models/*"
require "./api/*"
require "./router"

module Crystine
  process = Sentry.config(
    process_name: "Crystine API",
    build_command: "crystal",
    run_command: "./bin/crystine",
    build_args: ["build", "src/crystine.cr", "-o", "bin/crystine"],
    run_args: ["-p", "8000"]
  )

  Sentry.run(process) do
    Kemal.run
  end
end
