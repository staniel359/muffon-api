module Odnoklassniki
  module Search
    class Artists < Odnoklassniki::Search::Base
      ENDPOINT_NAME = 'artists'.freeze

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

      def raw_collection
        [
          raw_first_artist_data,
          *response_data['artists']
        ].compact
      end

      def raw_first_artist_data
        response_data.dig(
          'bestMatch',
          'artist'
        )
      end

      def items_count
        response_data.dig(
          'relevantCounts',
          'artists'
        )
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        Odnoklassniki::Search::Artists::Artist.call(
          raw_artist_data:,
          **self_args
        )
      end
    end
  end
end
