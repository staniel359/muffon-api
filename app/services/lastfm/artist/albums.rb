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
        artist.dig(
          '@attr',
          'artist'
        )
      end

      def artist
        response_data['topalbums']
      end

      def params
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
        artist['album']
      end

      def items_count
        artist
          .dig(
            '@attr',
            'total'
          )
          .to_i
      end

      def collection_item_data_formatted(album)
        LastFM::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
