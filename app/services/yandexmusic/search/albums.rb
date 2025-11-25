module YandexMusic
  module Search
    class Albums < YandexMusic::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count: MAXIMUM_ITEMS_COUNT
        )
      end

      def raw_collection
        response_data.dig(
          'albums',
          'items'
        )
      end

      def params
        {
          **super,
          type: 'album'
        }
      end

      def items_count
        response_data.dig(
          'albums',
          'total'
        )
      end

      def limit
        response_data.dig(
          'albums',
          'perPage'
        )
      end

      def collection_item_data_formatted(album)
        YandexMusic::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
