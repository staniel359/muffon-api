module Bandcamp
  module Search
    class Artists < Bandcamp::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'artists',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true
        )
      end

      def request_payload
        {
          **super,
          search_filter: SCOPES_TYPES_DATA['artists']
        }
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        Bandcamp::Search::Artists::Artist.call(
          raw_artist_data:,
          **self_args
        )
      end
    end
  end
end
