module Bandcamp
  module Search
    class Tracks < Bandcamp::Search::Base
      private

      def collection_name
        'tracks'
      end

      def matched?(result)
        result[:link][%r{/track/}].present?
      end
    end
  end
end
