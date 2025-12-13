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
          maximum_items_count:
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
          is_with_query_match: @args[:with_automatch],
          query_title: @args[:track_title],
          query_artist_name: @args[:artist_name],
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
