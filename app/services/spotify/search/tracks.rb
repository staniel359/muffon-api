module Spotify
  module Search
    class Tracks < Spotify::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count: MAXIMUM_ITEMS_COUNT
        )
      end

      def raw_collection
        response_data
          .dig(
            'tracks',
            'items'
          )
          .compact
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

      def collection_item_data_formatted(track)
        Spotify::Search::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
