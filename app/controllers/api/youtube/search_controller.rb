module API
  module YouTube
    class SearchController < API::BaseController
      def videos; end

      private

      def videos_data
        ::YouTube::Search::Videos.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end
    end
  end
end
