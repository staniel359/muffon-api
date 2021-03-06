module SoundCloud
  module Utils
    module Track
      private

      def title
        track['title']
      end

      def soundcloud_id
        track['id']
      end

      def artist
        @artist ||= track['user']
      end

      def image_data
        image_data_formatted(
          track['artwork_url'], 'track'
        )
      end

      def duration
        duration_formatted(
          track['duration'] / 1_000
        )
      end

      def audio_data
        {
          present: audio_present?,
          track_id: soundcloud_id,
          source_id: self.class::SOURCE_ID
        }
      end

      def audio_present?
        track['streamable']
      end
    end
  end
end
