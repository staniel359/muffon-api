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

      def albums
        @albums ||=
          [album_data_formatted]
      end

      def album_data_formatted
        {
          source_id: self.class::SOURCE_ID,
          spotify_id: album['id'],
          title: album['name']
        }
      end

      def album
        @album ||= track['album']
      end

      def image_data
        image_data_formatted(
          album, 'track'
        )
      end

      def duration_seconds
        track['duration_ms'].fdiv(
          1_000
        ).ceil
      end

      def audio_data
        {
          present: true,
          track_id: spotify_id,
          source_id: self.class::SOURCE_ID
        }
      end
    end
  end
end
