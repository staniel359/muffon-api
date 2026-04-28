module Genius
  module Track
    class Lyrics < Genius::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Lyrics.call(
          source_original_link:,
          source_name:,
          source_track_id: genius_id,
          title:,
          artists:,
          lyrics:
        )
      end
    end
  end
end
