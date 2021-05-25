module Genius
  module Search
    class Artists < Genius::Search::Base
      COLLECTION_NAME = 'artists'.freeze
      MODEL_NAME = 'artist'.freeze

      private

      def collection_item_data_formatted(artist)
        Genius::Search::Artists::Artist.call(
          artist: artist['result']
        )
      end
    end
  end
end
