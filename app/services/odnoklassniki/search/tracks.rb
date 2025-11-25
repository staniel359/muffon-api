module Odnoklassniki
  module Search
    class Tracks < Odnoklassniki::Search::Base
      ENDPOINT_NAME = 'tracks'.freeze

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
        response_data['tracks']
      end

      def items_count
        response_data.dig(
          'relevantCounts',
          'tracks'
        )
      end

      def collection_item_data_formatted(track)
        Odnoklassniki::Search::Tracks::Track.call(
          track:,
          albums:,
          is_with_query_match: @args[:with_automatch],
          query_title: @args[:track_title],
          query_artist_name: @args[:artist_name],
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      def albums
        response_data['albums']
      end
    end
  end
end
