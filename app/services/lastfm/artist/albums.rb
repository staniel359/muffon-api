module LastFM
  module Artist
    class Albums < LastFM::Artist::Base
      API_METHOD = 'artist.getTopAlbums'.freeze
      MAXIMUM_ITEMS_COUNT = 200

      private

      def artist_data
        {
          **super,
          **albums_data
        }
      end

      def name
        raw_artist_data.dig(
          '@attr',
          'artist'
        )
      end

      def raw_artist_data
        response_data['topalbums']
      end

      def request_params
        {
          **super,
          page:,
          limit:
        }
      end

      def albums_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count: MAXIMUM_ITEMS_COUNT
        )
      end

      def raw_collection
        raw_artist_data['album']
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
        raw_album_data
      )
        LastFM::Artist::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
