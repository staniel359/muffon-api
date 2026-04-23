module YandexMusic
  module Search
    class Tracks < YandexMusic::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count:
        )
      end

      def raw_collection
        response_data.dig(
          'tracks',
          'items'
        )
      end

      def params
        {
          **super,
          type: 'track'
        }
      end

      def items_count
        response_data.dig(
          'tracks',
          'total'
        )
      end

      def limit
        response_data.dig(
          'tracks',
          'perPage'
        )
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        YandexMusic::Search::Tracks::Track.call(
          raw_track_data:,
          is_with_query_match: @args[:with_automatch],
          query_title: @args[:track_title],
          query_artist_name: @args[:artist_name],
          **self_args
        )
      end
    end
  end
end
