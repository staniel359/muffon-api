module API
  module V1
    module Discogs
      class SearchController < API::V1::BaseController
        def artists
          render_data_with_status
        end

        def labels
          render_data_with_status
        end

        def groups
          render_data_with_status
        end

        def albums
          render_data_with_status
        end
      end
    end
  end
end
