module Bandcamp
  module Track
    class Links < Bandcamp::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Links.call(
          source_original_link:,
          source_name:,
          source_track_id: bandcamp_id
        )
      end
    end
  end
end
