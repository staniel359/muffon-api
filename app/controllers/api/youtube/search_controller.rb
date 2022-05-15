module API
  module YouTube
    class SearchController < API::BaseController
      def videos
        render_data_with_status
      end

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
