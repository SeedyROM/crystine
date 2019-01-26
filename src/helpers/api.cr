require "http/server"

module Peeper::Helpers::API
  extend self

  def respond_with_json(env : HTTP::Server::Context)
    env.response.content_type = "application/json" # REPLACE CONFIG
  end

  macro halt_404(env, message = "Not Found")
    payload = {"error" => {{ message}} }.to_json
    halt env, status_code: 404, response: payload
  end
end
