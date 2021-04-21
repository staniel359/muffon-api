module Genius
  module Track
    class Info < Genius::Track::Base
      private

      def track_data
        {
          title: title,
          artist: artist_data,
          lyrics: lyrics.truncate_words(50)
        }
      end
    end
  end
end
