module YouTube
  module Channel
    class Videos < YouTube::Channel::Base
      private

      def channel_data
        channel_base_data
          .merge(channel_videos_data)
      end

      def channel_videos_data
        uploads_playlist_data.slice(
          *%i[prev_page next_page videos]
        )
      end

      def uploads_playlist_data
        YouTube::Playlist::Videos.call(
          playlist_id: uploads_playlist_id,
          profile_id: @args[:profile_id],
          token: @args[:token],
          limit: @args[:limit],
          page: @args[:page]
        )[:playlist] || {}
      end

      def uploads_playlist_id
        channel.dig(
          'contentDetails',
          'relatedPlaylists',
          'uploads'
        )
      end
    end
  end
end
