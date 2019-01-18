module Peeper::API::Router
    get "/" do
        users = Peeper::Models::User.all
        # users.each do |user|
        #     puts user
        # end

        users
    end
end