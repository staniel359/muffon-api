module API
  module V1
    module YouTube
      class ChannelsController < API::V1::BaseController
        def videos
          render_data_with_status
        end

        private

        def videos_data
          ::YouTube::Channel::Videos.call(
            params.slice(
              *%i[channel_id page limit]
            )
          )
        end
      end
    end
  end
end
