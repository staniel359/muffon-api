module SoundCloud
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['title']
      end

      def artist_name
        artist['username']
      end

      def artist
        track['user']
      end

      def source_data
        {
          name: source_name,
          id: track['id']
        }
      end

      def image_data
        image_data_formatted(
          track['artwork_url']
        )
      end

      def duration
        track['duration'] / 1_000
      end

      def audio_data
        { present: audio_present? }
      end

      def audio_present?
        track['streamable']
      end
    end
  end
end
