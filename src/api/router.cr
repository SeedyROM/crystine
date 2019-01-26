module Crystine::API::Router
  extend API

  include Authentication
  include Models

  # post "/login" do |env|

  # end

  # post "/sign-up" do |env|
  #   email = env.params.json["email"].as(String)
  #   password = env.params.json["password"].as(String)
  #   password_confirm = env.params.json["password_confirm"].as(String)


  # end

  # get "/users" do |env|
  #   respond_with_json(env)

  #   users = User.all.to_a
  #   {:users => users}.to_json
  # end

  # get "/profile/:id" do |env|
  #   user = User.where{ _id == env.params.url["id"] }.first

  #   halt_404(env) if !user

  #   {
  #     :user => user,
  #     :posts => user.posts
  #   }.to_json
  # end
end
