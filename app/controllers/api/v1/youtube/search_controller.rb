module API
  module V1
    module YouTube
      class SearchController < API::V1::BaseController
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
end
