require "kemal"

require "./helpers/*"
require "./db"

require "./api/*"

module Peeper
  Kemal.run
end
