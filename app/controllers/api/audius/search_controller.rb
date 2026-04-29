module API
  module Audius
    class SearchController < API::BaseController
      def artists; end

      private

      def artists_data
        ::Audius::Search::Artists.call(
          params.slice(
            *%i[
              query
              profile_id
              token
              page
              limit
            ]
          )
        )
      end
    end
  end
end
