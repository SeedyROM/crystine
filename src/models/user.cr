class Peeper::Models::User < Jennifer::Model::Base
    with_timestamps
    mapping(
        id: Primary32,
        email: String,
        password_hash: String,
        is_active: {type: Bool, null: true},

        name: {type: String, null: true},

        created_at: {type: Time, null: true},
        updated_at: {type: Time, null: true}
    )

    validates_uniqueness :email
end