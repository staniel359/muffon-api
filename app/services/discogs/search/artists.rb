module Discogs
  module Search
    class Artists < Discogs::Search::Base
      COLLECTION_NAME = 'artists'.freeze
      COLLECTION_TYPE = 'artist'.freeze
      TOTAL_LIMIT = 200

      private

      def collection_item_data_formatted(artist)
        Discogs::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
