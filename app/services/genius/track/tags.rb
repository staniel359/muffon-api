module Genius
  module Track
    class Tags < Genius::Track::Base
      private

      def track_data
        {
          title: title,
          artist: artist_data,
          tags: tags
        }
      end
    end
  end
end
