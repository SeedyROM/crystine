require "../routes/*"

module Crystine::API
  module RouteInjector

    macro included
      macro routes(route_name)
        include Routes::\{{ route_name.id.capitalize }}
      end
    end

  end
end
