module Peeper::API::Router
    include Peeper::Models

    get "/" do
        test_user = User.where { _email == "test@test.com" }
        if test_user.exists?
            puts test_user
            next({:message => "A user existed"}.to_json)
        else
            next({:message => "User \"test@test.com\" not found, creating it now..."}.to_json)
        end
    end
end