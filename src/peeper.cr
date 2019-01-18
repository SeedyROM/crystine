require "kemal"
require "jennifer"

require "./models/*"
require "./api/*"

module Peeper
  Kemal.run
end
