module API
  module V1
    module Bandcamp
      class IdController < API::V1::BaseController
        def artist
          render_data_with_status
        end

        def album
          render_data_with_status
        end

        def track
          render_data_with_status
        end
      end
    end
  end
end
