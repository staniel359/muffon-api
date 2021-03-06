module Discogs
  module Search
    class Artists < Discogs::Search::Base
      COLLECTION_NAME = 'artists'.freeze
      COLLECTION_TYPE = 'artist'.freeze

      private

      def collection_item_data_formatted(artist)
        Discogs::Search::Artists::Artist.call(
          artist: artist
        )
      end
    end
  end
end
