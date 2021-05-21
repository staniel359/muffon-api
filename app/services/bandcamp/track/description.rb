module Bandcamp
  module Track
    class Description < Bandcamp::Track::Base
      private

      def track_data
        { description: description }
      end
    end
  end
end
