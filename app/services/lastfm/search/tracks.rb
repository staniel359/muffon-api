module LastFM
  module Search
    class Tracks < LastFM::Search::Base
      API_METHOD = 'track.search'.freeze

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
          'results',
          'trackmatches',
          'track'
        )
      end

      def request_params
        {
          **super,
          track: @args[:query]
        }
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        LastFM::Search::Tracks::Track.call(
          raw_track_data:,
          **self_args
        )
      end
    end
  end
end
