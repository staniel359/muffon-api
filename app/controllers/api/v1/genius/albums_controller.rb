module API
  module V1
    module Genius
      class AlbumsController < API::V1::BaseController
        def info
          render_data_with_status
        end

        def description
          render_data_with_status
        end
      end
    end
  end
end
