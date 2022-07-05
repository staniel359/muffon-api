module Spotify
  module Search
    class Artists < Spotify::Search::Base
      COLLECTION_TYPE = 'artist'.freeze
      TOTAL_LIMIT = 200

      private

      def collection_item_data_formatted(artist)
        Spotify::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
