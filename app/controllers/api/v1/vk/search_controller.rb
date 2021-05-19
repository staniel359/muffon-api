module API
  module V1
    module VK
      class SearchController < API::V1::BaseController
        def tracks
          render_data_with_status
        end

        def albums
          render_data_with_status
        end
      end
    end
  end
end
