module API
  module V1
    module YouTube
      class SearchController < API::V1::BaseController
        def videos
          render_data_with_status
        end
      end
    end
  end
end
