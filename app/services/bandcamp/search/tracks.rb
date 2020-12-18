module Bandcamp
  module Search
    class Tracks < Bandcamp::Search::Base
      private

      def collection_name
        'tracks'
      end

      def matched_result(result)
        result[:link].include?('/track/')
      end
    end
  end
end
