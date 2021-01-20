module Bandcamp
  module Search
    class Tracks < Bandcamp::Search::Base
      private

      def collection_name
        'tracks'
      end

      def model_name
        'track'
      end
    end
  end
end
