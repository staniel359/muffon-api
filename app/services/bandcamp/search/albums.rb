module Bandcamp
  module Search
    class Albums < Bandcamp::Search::Base
      private

      def collection_name
        'albums'
      end

      def matched?(result)
        result[:link][%r{/album/}].present?
      end
    end
  end
end
