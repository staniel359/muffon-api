module API
  module YouTube
    class ChannelsController < API::BaseController
      def info
        render_data_with_status
      end

      def description
        render_data_with_status
      end

      def videos
        render_data_with_status
      end

      private

      def info_data
        ::YouTube::Channel::Info.call(
          params.slice(
            *%i[channel_id]
          )
        )
      end

      def description_data
        ::YouTube::Channel::Description.call(
          params.slice(
            *%i[channel_id]
          )
        )
      end

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
