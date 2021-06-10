module API
  module V1
    module YouTube
      class ChannelsController < API::V1::BaseController
        def videos
          render_data_with_status
        end
      end
    end
  end
end
