module YouTube
  class Playlists
    class Playlist < YouTube::Playlists
      include YouTube::Utils::Playlist

      def call
        data
      end

      private

      def data
        self_data
          .merge(playlist_data)
      end

      def playlist_data
        {
          source: source_data,
          title:,
          channel: channel_data,
          image: image_data,
          description:
            description_truncated,
          videos_count:,
          publish_date:
        }.compact
      end

      def playlist
        @args[:playlist]
      end
    end
  end
end
