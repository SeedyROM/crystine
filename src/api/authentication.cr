require "crypto/bcrypt/password"
require "jwt"

module Peeper::Authentication 
  include Models
  
  @@PASSWORD_COST : Int32 = 10
  @@JWT_SECRET : String = "D921A887A29083A43A394A9E04D2EFF9" # Change this!
  @@JWT_TYPE : String = "HS256"
  @@JWT_EXPIRATION : Int32 = 60 * 120 # Expire in 2 hours

  class InvalidLoginCredentials < Exception end
  class NonMatchingPasswords < Exception end
  class UserAlreadyExists < Exception end

  def hash_password(password : String )
    Crypto::Bcrypt::Password.create(password, cost: @@PASSWORD_COST)
  end

  def authenticate(email : String, password : String)
    user = User.where{ _email = email }.first
    raise InvalidLoginCredentials.new if !user || hash_password(password) != user.password_hash
    
    user
  end

  def register(email : String, password : String, password_confirm : String)
    raise NonMatchingPasswords.new if password != password_confirm

    new_user = User.new(
      email: email,
      password: hash_password(password)
    )
    raise UserAlreadyExists.new if !new_user.valid?

    authenticate(email, password)
  end

  def create_jwt(user : User)
    payload = {
      "id" => user.id,
      "email" => user.email,
      "exp" => Time.now.to_unix + @@JWT_EXPIRATION
    }

    JWT.encode(payload, @@JWT_SECRET, @@JWT_TYPE)
  end

  def parse_jwt(token : String)
    JWT.decode(token, @@JWT_SECRET, @@JWT_TYPE)
  end
end