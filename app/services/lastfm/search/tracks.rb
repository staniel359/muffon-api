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
          maximum_items_count: MAXIMUM_ITEMS_COUNT
        )
      end

      def raw_collection
        response_data.dig(
          'results',
          'trackmatches',
          'track'
        )
      end

      def params
        {
          **super,
          track: @args[:query]
        }
      end

      def collection_item_data_formatted(track)
        LastFM::Search::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
