require "crypto/bcrypt/password"
require "jwt"

module Peeper::Authentication 
  include Models

  @@JWT_SECRET : String = "D921A887A29083A43A394A9E04D2EFF9" # Change this!
  @@JWT_TYPE : String = "HS256"
  @@JWT_EXPIRATION : Int32 = 60 * 120 # Expire in 2 hours

  class InvalidLoginCredentials < Exception end

  def authenticate(email, password)
    user = User.where{ _email = email }.first
    hashed_password = Crypto::Bcrypt::Password.create(password, cost: 10)

    if !user || hashed_password != user.password_hash
      raise InvalidLoginCredentials.new
    end

    user   
  end

  def create_jwt(user : User)
    payload = {
      "id" => user.id,
      "email" => user.email,
      "exp" => Time.now.to_unix + @@JWT_EXPIRATION
    }

    JWT.encode(payload, @@JWT_SECRET, @@JWT_TYPE)
  end

  def parse_jwt(token)
    JWT.decode(token, @@JWT_SECRET, @@JWT_TYPE)
  end
end