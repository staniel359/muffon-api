module LastFM
  module Artist
    class Tracks < LastFM::Artist::Base
      API_METHOD = 'artist.getTopTracks'.freeze
      MAXIMUM_ITEMS_COUNT = 1_000

      private

      def artist
        response_data['toptracks']
      end

      def params
        {
          **super,
          page:,
          limit:
        }
      end

      def artist_data
        {
          **super,
          **tracks_data
        }
      end

      def name
        artist.dig(
          '@attr',
          'artist'
        )
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
        artist['track']
      end

      def items_count
        artist
          .dig(
            '@attr',
            'total'
          )
          .to_i
      end

      def collection_item_data_formatted(track)
        LastFM::Artist::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
