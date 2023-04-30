module Genius
  module Track
    class Links < Genius::Track::Info
      private

      def track_data
        { links: source_links }
      end
    end
  end
end
