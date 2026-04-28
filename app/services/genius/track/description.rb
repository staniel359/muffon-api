module Genius
  module Track
    class Description < Genius::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Description.call(
          description:
        )
      end
    end
  end
end
