module Bandcamp
  module Track
    class Links < Bandcamp::Track::Info
      private

      def track_data
        { links: source_links }
      end
    end
  end
end
