module SoundCloud
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['title']
      end

      def soundcloud_id
        track['id']
      end

      def artist
        track['user']
      end

      def image_data
        image_data_formatted(
          track['artwork_url']
        )
      end

      def duration_seconds
        track['duration'] / 1_000
      end

      def audio_data
        {
          source_id:,
          present: audio_present?,
          track_id: soundcloud_id
        }
      end

      def audio_present?
        track['streamable']
      end
    end
  end
end
