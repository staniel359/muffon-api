module Genius
  module Track
    class Links < Genius::Track::Info
      private

      def track_data
        Muffon::Formatter::Track::Links.call(
          source_original_link:,
          source_name:,
          source_track_id: genius_id
        )
      end
    end
  end
end
