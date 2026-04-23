module AmazonMusic
  module Search
    class Artists < AmazonMusic::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'artists',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def link
        "#{BASE_LINK}/searchCatalogArtists"
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        AmazonMusic::Search::Artists::Artist.call(
          raw_artist_data:,
          **self_args
        )
      end
    end
  end
end
