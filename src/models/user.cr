require "jennifer/model/authentication"

module Crystine
  class Models::User < Jennifer::Model::Base
    include Jennifer::Model::Authentication
    include Serializer


    mapping(
      id: Primary32,
      email: {type: String, default: ""},
      is_active: {type: Bool, null: true},

      password_digest: {type: String, default: ""},
      password: Password,
      password_confirmation: { type: String?, virtual: true },

      name: {type: String, null: true},

      created_at: {type: Time, null: true},
      updated_at: {type: Time, null: true}
      )

    with_timestamps
    with_authentication

    validates_uniqueness :email
    serialize_fields :id, :email, :name, :created_at

    has_many :posts, Post
  end
end
