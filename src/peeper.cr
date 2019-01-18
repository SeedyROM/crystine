require "kemal"

require "./db"
require "./api/*"

module Peeper
  Kemal.run
end
