module Genius
  module Track
    class Lyrics < Genius::Track::Info
      private

      def track_data
        track_base_data
          .merge(lyrics_data)
      end

      def track_base_data
        {
          source: source_data,
          title:,
          artist: artists_minimal_data,
          artists:
        }
      end

      def lyrics_data
        { lyrics: }
      end
    end
  end
end
