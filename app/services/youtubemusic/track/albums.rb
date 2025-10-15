module YouTubeMusic
  module Track
    class Albums < YouTubeMusic::Track::Info
      private

      def track_data
        {
          **track_base_data,
          albums:
        }
      end

      def albums
        [album_data]
      end

      def album_data
        {
          **self_data,
          source: album_source_data,
          title: album_title,
          artist: artists_base_data,
          artists:,
          image: image_data,
          release_date: album_release_date
        }
      end
    end
  end
end
