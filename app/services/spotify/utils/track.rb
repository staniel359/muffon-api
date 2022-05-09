module Spotify
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['name']
      end

      def spotify_id
        track['id']
      end

      def artists_list
        track['artists']
      end

      def album_data
        return if album.blank?

        {
          source_id:,
          spotify_id: album_id,
          title: album_title
        }
      end

      def album
        track['album']
      end

      def album_id
        album['id']
      end

      def album_title
        album['name']
      end

      def image_data
        image_data_formatted(
          album['images']
        )
      end

      def duration_seconds
        track['duration_ms'].fdiv(
          1_000
        ).ceil
      end

      def audio_data
        {
          source_id:,
          present: true,
          track_id: spotify_id
        }
      end
    end
  end
end
