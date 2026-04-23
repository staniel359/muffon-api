module Bandcamp
  module Track
    class Tags < Bandcamp::Track::Info
      private

      def track_data
        Muffon::Formatter::Track::Tags.call(
          tags:
        )
      end
    end
  end
end
