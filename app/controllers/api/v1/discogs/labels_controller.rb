module API
  module V1
    module Discogs
      class LabelsController < API::V1::BaseController
        def info
          render_data_with_status
        end

        def albums
          render_data_with_status
        end
      end
    end
  end
end
