module YouTube
  module Channel
    class Videos < YouTube::Channel::Base
      private

      def channel_data
        {
          **super,
          prev_page:,
          next_page:,
          videos:
        }.compact
      end

      def prev_page
        uploads_playlist_data[
          :prev_page
        ]
      end

      def uploads_playlist_data
        @uploads_playlist_data ||=
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

      def next_page
        uploads_playlist_data[
          :next_page
        ]
      end

      def videos
        uploads_playlist_data[
          :videos
        ] || []
      end
    end
  end
end
