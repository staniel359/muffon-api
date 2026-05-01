module YandexMusic
  module Search
    class Artists < YandexMusic::Search::Base
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
        response_data.dig(
          'artists',
          'items'
        )
      end

      def request_params
        {
          **super,
          type: 'artist'
        }
      end

      def items_count
        response_data.dig(
          'artists',
          'total'
        )
      end

      def limit
        response_data.dig(
          'artists',
          'perPage'
        )
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        YandexMusic::Search::Artists::Artist.call(
          raw_artist_data:,
          **self_args
        )
      end
    end
  end
end
