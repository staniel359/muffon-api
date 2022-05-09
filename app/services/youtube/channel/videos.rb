module YouTube
  module Channel
    class Videos < YouTube::Channel::Base
      private

      def no_data?
        uploads_playlist.blank?
      end

      def uploads_playlist
        @uploads_playlist ||=
          YouTube::Playlist::Videos.call(
            playlist_id: uploads_playlist_id,
            limit: @args[:limit],
            page: @args[:page]
          )[:playlist]
      end

      def uploads_playlist_id
        response_data.dig(
          'items', 0, 'contentDetails',
          'relatedPlaylists', 'uploads'
        )
      end

      def channel_data
        channel_base_data
          .merge(channel_videos_data)
      end

      def title
        response_data.dig(
          'items', 0,
          'snippet', 'title'
        )
      end

      def channel_videos_data
        {
          prev_page:
            uploads_playlist[:prev_page],
          next_page:
            uploads_playlist[:next_page],
          videos:
        }.compact
      end

      def videos
        uploads_playlist[:videos] || []
      end
    end
  end
end
