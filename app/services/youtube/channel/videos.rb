module YouTube
  module Channel
    class Videos < YouTube::Channel::Base
      private

      def no_data?
        uploads_playlist.blank?
      end

      def uploads_playlist
        @uploads_playlist ||= YouTube::Playlist::Videos.call(
          playlist_id: uploads_playlist_id,
          limit: @args.limit,
          next_page: @args.next_page
        )[:playlist]
      end

      def uploads_playlist_id
        response_data.dig(
          'items', 0, 'contentDetails',
          'relatedPlaylists', 'uploads'
        )
      end

      def channel_data
        uploads_playlist.slice(
          :next_page, :videos
        )
      end
    end
  end
end