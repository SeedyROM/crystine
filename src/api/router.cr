module Peeper::API::Router
    include Peeper::Models

    get "/" do
        test_user = User.where { _email == "test@test.com" }

        if test_user.exists?
            puts test_user.results
            next({:message => "A user existed"}.to_json)
        else
            test_user_model = User.new({
                :email => "test@test.com", 
                :password_hash => "32hdsjh29d39j2"
            })
            test_user_model.save
            
            next({:message => "User \"test@test.com\" not found, creating it now..."}.to_json)
        end
    end
end