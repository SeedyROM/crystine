module Crystine::Routes
  module Users
    extend API
    extend Authentication

    include Models

    get "/users" do |env|
      respond_with_json(env)

      users = User.all.to_a
      {:users => users}.to_json
    end

    get "/users/:id" do |env|
      user = User.where { _id == env.params.url["id"] }.first
      handle_error(env, 404) if !user

      {:user => user}.to_json
    end

    post "/users" do |env|
      email = env.params.json["email"].as(String)
      password = env.params.json["password"].as(String)
      password_confirm = env.params.json["password_confirm"].as(String)

      user = User.build(
        email: email,
        password: password,
        password_confirmation: password_confirm
      )

      created_user = user.save()
      handle_error(env, 400, "Invalid User") if !created_user

      authenticate(email, password)

      { :user => created_user }
    end
  end
end
