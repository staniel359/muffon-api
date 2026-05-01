module Audius
  module Search
    class Artists < Audius::Search::Base
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

      def raw_collection
        response_data.dig(
          'data',
          'users'
        )
      end

      def request_params
        {
          **super,
          kind: 'users'
        }
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        Audius::Search::Artists::Artist.call(
          raw_artist_data:,
          **self_args
        )
      end
    end
  end
end
