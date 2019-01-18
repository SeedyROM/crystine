class Peeper::Models::User < Jennifer::Model::Base
    with_timestamps
    mapping(
        id: Primary32,
        email: String,
        password_hash: String,
        is_active: Bool,

        name: String,

        created_at: Time,
        updated_at: Time
    )

    # validate_uniqueness :email
end