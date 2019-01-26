class Crystine::Models::Post < Jennifer::Model::Base
  include Serializer

  with_timestamps
  mapping(
    id: Primary32,
    body: String,
    user_id: Primary32,

    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  serialize_fields :body, :created_at

  belongs_to :user, User
end
