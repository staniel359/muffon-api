module VK
  module Search
    class Artists < VK::Search::Base
      API_METHOD = 'audio.searchArtists'.freeze

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

      def collection_item_data_formatted(
        raw_artist_data
      )
        VK::Search::Artists::Artist.call(
          raw_artist_data:,
          **self_args
        )
      end
    end
  end
end
