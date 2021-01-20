module Bandcamp
  module Search
    class Albums < Bandcamp::Search::Base
      private

      def collection_name
        'albums'
      end

      def model_name
        'album'
      end
    end
  end
end
