module Audius
  module Track
    class Description < Audius::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Description.call(
          description:
        )
      end
    end
  end
end
