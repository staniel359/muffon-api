module Genius
  module Track
    class Description < Genius::Track::Info
      private

      def track_data
        { description: description }
      end
    end
  end
end
