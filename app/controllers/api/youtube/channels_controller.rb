module API
  module YouTube
    class ChannelsController < API::BaseController
      def info; end

      def description; end

      def videos; end

      def playlists; end

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
            *%i[channel_id profile_id token page limit]
          )
        )
      end

      def playlists_data
        ::YouTube::Channel::Playlists.call(
          params.slice(
            *%i[channel_id page limit]
          )
        )
      end
    end
  end
end
