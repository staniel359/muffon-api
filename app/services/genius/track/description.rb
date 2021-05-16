module Genius
  module Track
    class Description < Genius::Track::Base
      private

      def track_data
        {
          title: title,
          artist: artist_data,
          description: description
        }
      end
    end
  end
end
