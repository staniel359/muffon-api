module Bandcamp
  module Search
    class Albums < Bandcamp::Search::Base
      private

      def collection_name
        'albums'
      end

      def matched_result(result)
        result[:link].include?('/album/')
      end
    end
  end
end
