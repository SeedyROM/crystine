require "http/server"

module Crystine::API
  def respond_with_json(env : HTTP::Server::Context)
    env.response.content_type = "application/json" # REPLACE CONFIG
  end

  macro extended
    macro handle_error(env, status_code, message = "Not Found")
      payload = {"error" => \{{ message }} }.to_json
      halt env, status_code: \{{ status_code }}, response: payload
    end
  end
end
