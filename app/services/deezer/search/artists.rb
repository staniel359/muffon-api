module Deezer
  module Search
    class Artists < Deezer::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'artists',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count:
        )
      end

      def request_payload
        {
          **super,
          output: 'ARTIST'
        }.to_json
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        Deezer::Search::Artists::Artist.call(
          raw_artist_data:,
          **self_args
        )
      end
    end
  end
end
