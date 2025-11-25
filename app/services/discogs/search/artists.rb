module Discogs
  module Search
    class Artists < Discogs::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'artists',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count: MAXIMUM_ITEMS_COUNT
        )
      end

      def params
        {
          **super,
          type: 'artist'
        }
      end

      def collection_item_data_formatted(artist)
        Discogs::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
