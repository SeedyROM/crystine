module Crystine::Routes
  module Users
    extend API
    include Authentication
    include Models

    get "/users" do |env|
      respond_with_json(env)

      User.inspect

      users = User.all.to_a
      {:users => users}.to_json
    end

    get "/users/:id" do |env|
      user = User.where { _id == env.params.url["id"] }.first

      halt_404(env) if !user

      {
        :user => user
      }.to_json
    end

    post "/users" do |env|
      email = env.params.json["email"].as(String)
      password = env.params.json["password"].as(String)
      password_confirm = env.params.json["password_confirm"].as(String)
    end
  end
end
