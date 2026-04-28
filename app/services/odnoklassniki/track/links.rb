module Odnoklassniki
  module Track
    class Links < Odnoklassniki::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Links.call(
          source_original_link:,
          source_name:,
          source_track_id: odnoklassniki_id
        )
      end
    end
  end
end
