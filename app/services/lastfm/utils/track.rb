module LastFM
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['name']
      end

      def artist_name
        artist['name']
      end

      def artist
        track['artist']
      end

      def duration_seconds
        track['duration'].to_i
      end

      def listeners_count
        track['listeners'].to_i
      end
    end
  end
end
