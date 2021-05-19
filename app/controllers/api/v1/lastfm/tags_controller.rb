module API
  module V1
    module LastFM
      class TagsController < API::V1::BaseController
        def info
          render_data_with_status
        end

        def description
          render_data_with_status
        end

        def artists
          render_data_with_status
        end

        def albums
          render_data_with_status
        end

        def tracks
          render_data_with_status
        end

        def similar
          render_data_with_status
        end
      end
    end
  end
end
