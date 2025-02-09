module AmazonMusic
  module Search
    class Artists < AmazonMusic::Search::Base
      COLLECTION_NAME = 'artists'.freeze

      private

      def link
        "#{BASE_LINK}/searchCatalogArtists"
      end

      def collection_item_data_formatted(artist)
        AmazonMusic::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
