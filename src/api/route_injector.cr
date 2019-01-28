require "../routes/*"

module Crystine::API
  module RouteInjector
    macro routes(route_name)
      include Routes::{{ route_name.id.capitalize }}
    end
  end
end
