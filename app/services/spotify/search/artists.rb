module Spotify
  module Search
    class Artists < Spotify::Search::Base
      COLLECTION_TYPE = 'artist'.freeze
      COLLECTION_NAME = 'artists'.freeze

      private

      def collection_item_data_formatted(artist)
        Spotify::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
