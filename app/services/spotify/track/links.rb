module Spotify
  module Track
    class Links < Spotify::Track::Info
      private

      def track_data
        { links: source_links }
      end
    end
  end
end
