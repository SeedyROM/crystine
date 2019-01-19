module Peeper::API::Router
  include Models

  get "/users" do
    query = User.where { _email == "test@test.com" }

    {:users => query.to_a}.to_json
  end
end
