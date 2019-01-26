require "jennifer"
require "jennifer/adapter/postgres"

require "../config/jennifer"
require "../priv/migrations/*"

require "sam"
load_dependencies "jennifer"

# Other tasks here

Sam.help
