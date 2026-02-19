module MusixMatch
  module Artist
    class Albums < MusixMatch::Artist::Base
      ALBUMS_TYPES_DATA = {
        'album' => 'artistAlbums',
        'ep' => 'artistExtendedPlayAlbums',
        'single' => 'artistSingleAlbums'
      }.freeze

      include MusixMatch::Utils::Artist

      private

      def required_args
        super + %i[
          albums_type
        ]
      end

      def artist_data
        {
          **super,
          **albums_data
        }
      end

      def albums_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true
        )
      end

      def raw_collection
        response_data.dig(
          'pageProps',
          'data',
          albums_type_key,
          'data'
        )
      end

      def link
        "#{BASE_LINK}/artist/#{@args[:artist_slug]}/albums.json"
      end

      def albums_type_key
        ALBUMS_TYPES_DATA[@args[:albums_type]]
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        MusixMatch::Artist::Albums::Album.call(
          raw_album_data:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
