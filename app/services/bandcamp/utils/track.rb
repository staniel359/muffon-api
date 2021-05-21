module Bandcamp
  module Utils
    module Track
      private

      def title
        track['title']
      end

      def bandcamp_id
        track['track_id']
      end

      def artists
        [artist_data_formatted]
      end

      def artist_data_formatted
        {
          name: track['band_name'],
          bandcamp_id: artist_bandcamp_id
        }
      end

      def artist_bandcamp_id
        track['band_id']
      end

      def duration
        duration_formatted(
          track['duration']
        )
      end

      def audio_data
        {
          present: audio_link.present?,
          track_id: bandcamp_id,
          artist_id: artist_bandcamp_id,
          source_id: self.class::SOURCE_ID
        }
      end

      def audio_link
        @audio_link ||= track.dig(
          'streaming_url', 'mp3-128'
        )
      end
    end
  end
end
