module Bandcamp
  module Track
    class Description < Bandcamp::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Description.call(
          description:
        )
      end
    end
  end
end
