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
          maximum_items_count:
        )
      end

      def request_params
        {
          **super,
          type: SCOPES_PARAMS_DATA['artists']
        }
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        Discogs::Search::Artists::Artist.call(
          raw_artist_data:,
          **self_args
        )
      end
    end
  end
end
