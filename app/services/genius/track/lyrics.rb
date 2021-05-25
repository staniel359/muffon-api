module Genius
  module Track
    class Lyrics < Genius::Track::Base
      private

      def track_data
        { lyrics: lyrics }
      end
    end
  end
end
