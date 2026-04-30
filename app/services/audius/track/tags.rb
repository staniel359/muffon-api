module Audius
  module Track
    class Tags < Audius::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Tags.call(
          tags:
        )
      end
    end
  end
end
