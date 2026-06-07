module Deezer
  module Search
    class Tracks < Deezer::Search::Base
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

      def request_payload
        {
          **super,
          output: 'TRACK'
        }.to_json
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        Deezer::Search::Tracks::Track.call(
          raw_track_data:,
          **self_args
        )
      end
    end
  end
end
