module Peeper::API::Router
    include Peeper::Models

    get "/" do
        # Build a database query
        query = User.where { _email == "test@test.com" }

        # Run the query to determine if the record exists
        if query.exists?
            # Convert the query to an array and take the first item.
            test_user = query.to_a[0]
            
            # Respond with the users email
            next({:message => "A user existed: #{test_user.email}"}.to_json)
        else
            # Create an instance of a User model
            test_user = User.new({
                :email => "test@test.com", 
                :password_hash => "32hdsjh29d39j2"
            })
            # Save it to the database without validation 
            test_user.save
            
            # Respond accordingly
            next({:message => "User \"test@test.com\" not found, creating it now..."}.to_json)
        end
    end
end