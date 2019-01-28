module Crystine::Routes
  module Auth
    extend API
    extend Authentication

    post "/login" do |env|
      email = env.params.json["email"].as(String)
      password = env.params.json["password"].as(String)

      user = authenticate(email, password)
      handle_error(env, 400, "Invalid login credentials") if !user

      respond_with_jwt(user)
    end
  end
end
