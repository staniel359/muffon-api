module Audius
  module Track
    class Links < Audius::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Links.call(
          source_original_link:,
          source_name:,
          source_track_id: audius_id
        )
      end
    end
  end
end
