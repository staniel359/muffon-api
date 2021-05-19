module API
  module V1
    module LastFM
      class TopController < API::V1::BaseController
        def artists
          render_data_with_status
        end

        def tracks
          render_data_with_status
        end

        def tags
          render_data_with_status
        end
      end
    end
  end
end
