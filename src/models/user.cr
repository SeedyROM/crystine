class Crystine::Models::User < Jennifer::Model::Base
  include Serializer

  with_timestamps
  mapping(
    id: Primary32,
    email: String,
    is_active: {type: Bool, null: true},

    password_hash: String,

    name: {type: String, null: true},

    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  validates_uniqueness :email
  serialize_fields :email, :name, :created_at, :posts

  has_many :posts, Post
end
