require "kemal"

require "./helpers/*"
require "./db"

require "./api/*"

class JSONReponseHandler < Kemal::Handler
  def call(context)
    context.response.content_type = "application/json"
    call_next context
  end
end

module Peeper
  pp 
  add_handler JSONReponseHandler.new
  Kemal.run
end
