module Spotify
  module Utils
    module Track
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

      def image_data
        image_data_formatted(album, 'track')
      end

      def album
        @album ||= track['album']
      end

      def duration
        duration_formatted(
          track['duration_ms'].fdiv(1_000).ceil
        )
      end

      def audio_data
        {
          present: false,
          track_id: spotify_id,
          source_id: self.class::SOURCE_ID
        }
      end
    end
  end
end
