module Bandcamp
  module Track
    class Tags < Bandcamp::Track::Base
      private

      def track_data
        { tags: tags }
      end
    end
  end
end
