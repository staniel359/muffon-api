module Deezer
  module Track
    class Links < Deezer::Track::Info
      private

      def track_data
        { links: source_links }
      end
    end
  end
end
