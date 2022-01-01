module Bandcamp
  module Track
    class Description < Bandcamp::Track::Info
      private

      def track_data
        { description: }
      end
    end
  end
end
