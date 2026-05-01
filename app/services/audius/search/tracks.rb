module Audius
  module Search
    class Tracks < Audius::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true
        )
      end

      def raw_collection
        response_data.dig(
          'data',
          'tracks'
        )
      end

      def request_params
        {
          **super,
          kind: 'tracks'
        }
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        Audius::Search::Tracks::Track.call(
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
