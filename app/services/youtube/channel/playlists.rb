module YouTube
  module Channel
    class Playlists < YouTube::Channel::Base
      private

      def channel_data
        channel_base_data
          .merge(channel_playlists_data)
      end

      def channel_playlists_data
        playlists_data.slice(
          *%i[prev_page next_page playlists]
        )
      end

      def playlists_data
        YouTube::Playlists.call(
          channel_id: @args[:channel_id],
          limit: @args[:limit],
          page: @args[:page]
        )
      end
    end
  end
end
