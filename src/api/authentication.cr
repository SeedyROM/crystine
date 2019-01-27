require "crypto/bcrypt/password"
require "jwt"

module Crystine::Authentication
  include Models

  JWT_SECRET = "D921A887A29083A43A394A9E04D2EFF9" # Change this!
  JWT_TYPE = "HS256"
  JWT_EXPIRATION = 7200 # Expire in 2 hours

  def authenticate(email : String, password : String)
    user = User.where { _email == email }.first
    return nil if !user

    authenticated = user.authenticate(password)
    return nil if !authenticated

    user
  end

  def respond_with_jwt(user : User)
    payload = {
      "id" => user.id,
      "email" => user.email,
      "exp" => Time.now.to_unix + JWT_EXPIRATION
    }

    {
      :jwt => JWT.encode(payload, JWT_SECRET, JWT_TYPE),
      :exp => JWT_EXPIRATION
    }.to_json

  end

  def parse_jwt(token : String)
    JWT.decode(token, JWT_SECRET, JWT_TYPE)
  end
end
