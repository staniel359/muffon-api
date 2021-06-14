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
          page: @args.page
        )[:playlist]
      end

      def uploads_playlist_id
        response_data.dig(
          'items', 0, 'contentDetails',
          'relatedPlaylists', 'uploads'
        )
      end

      def channel_data
        { title: title }.merge(
          uploads_playlist_data
        )
      end

      def title
        response_data.dig(
          'items', 0, 'snippet', 'title'
        )
      end

      def uploads_playlist_data
        uploads_playlist.slice(
          :prev_page, :next_page, :videos
        )
      end
    end
  end
end
