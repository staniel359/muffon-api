module Deezer
  module Search
    class Artists < Deezer::Search::Base
      COLLECTION_NAME = 'artists'.freeze
      MODEL_NAME = 'artist'.freeze

      private

      def collection_item_data_formatted(artist)
        Deezer::Search::Artists::Artist.call(
          artist: artist
        )
      end
    end
  end
end
