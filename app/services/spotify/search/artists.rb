module Spotify
  module Search
    class Artists < Spotify::Search::Base
      COLLECTION_NAME = 'artists'.freeze
      COLLECTION_TYPE = 'artist'.freeze

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
