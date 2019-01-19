module Peeper::API::Router
  include Models

  get "/users" do
    users = User.all.to_a
    {:users => users}.to_json
  end

  get "/profile/:id" do |env|
    user = User.where{ _id == env.params.url["id"] }.first

    if !user
      halt env, status_code: 404, response: "Not Found"
    end

    {
      :user => user,
      :posts => user.posts
    }.to_json
  end
end
