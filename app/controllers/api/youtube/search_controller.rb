module API
  module YouTube
    class SearchController < API::BaseController
      def videos; end

      private

      def videos_data
        ::YouTube::Search::Videos.call(
          params.slice(
            *%i[query page limit]
          )
        )
      end
    end
  end
end
