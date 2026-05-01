module Bandcamp
  module Search
    class Tracks < Bandcamp::Search::Base
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

      def request_payload
        {
          **super,
          search_filter: SCOPES_TYPES_DATA['tracks']
        }
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        Bandcamp::Search::Tracks::Track.call(
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
