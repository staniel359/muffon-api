module Genius
  module Track
    class Description < Genius::Track::Base
      private

      def track_data
        { description: description }
      end
    end
  end
end
