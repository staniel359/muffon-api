module Genius
  module Track
    class Tags < Genius::Track::Info
      private

      def track_data
        Muffon::Formatter::Track::Tags.call(
          tags:
        )
      end
    end
  end
end
