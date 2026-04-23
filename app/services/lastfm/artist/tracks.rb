module LastFM
  module Artist
    class Tracks < LastFM::Artist::Base
      API_METHOD = 'artist.getTopTracks'.freeze
      MAXIMUM_ITEMS_COUNT = 1_000

      private

      def artist_data
        {
          **super,
          **tracks_data
        }
      end

      def name
        raw_artist_data.dig(
          '@attr',
          'artist'
        )
      end

      def raw_artist_data
        response_data['toptracks']
      end

      def params
        {
          **super,
          page:,
          limit:
        }
      end

      def tracks_data
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
        raw_artist_data['track']
      end

      def items_count
        raw_artist_data
          .dig(
            '@attr',
            'total'
          )
          .to_i
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        LastFM::Artist::Tracks::Track.call(
          raw_track_data:,
          **self_args
        )
      end
    end
  end
end
