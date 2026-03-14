module Spotify
  module Artist
    class Albums < Spotify::Artist::Base
      ALBUMS_QUERIES_DATA = {
        'album' => 'queryArtistDiscographyAlbums',
        'single_ep' => 'queryArtistDiscographySingles'
      }.freeze
      ALBUMS_COLLECTIONS_DATA = {
        'album' => 'albums',
        'single_ep' => 'singles'
      }.freeze

      private

      def required_args
        super + %i[
          album_type
        ]
      end

      def wrong_args?
        albums_query.blank?
      end

      def albums_query
        ALBUMS_QUERIES_DATA[@args[:album_type]]
      end

      def artist_data
        {
          **super,
          **albums_data
        }
      end

      def name
        artist_info_data[:name]
      end

      def albums_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        raw_artist_data.dig(
          'discography',
          raw_collection_name,
          'items'
        )
      end

      def raw_collection_name
        ALBUMS_COLLECTIONS_DATA[@args[:album_type]]
      end

      def payload
        {
          'variables' => {
            'uri' => spotify_uri,
            'offset' => offset,
            'limit' => limit,
            'order' => 'DATE_DESC'
          },
          'operationName' => albums_query,
          'extensions' => {
            'persistedQuery' => {
              'version' => 1,
              'sha256Hash' => '5e07d323febb57b4a56a42abbf781490e58764aa45feb6e3dc0591564fc56599' # rubocop:disable Layout/LineLength
            }
          }
        }.to_json
      end

      def spotify_uri
        "spotify:artist:#{@args[:artist_id]}"
      end

      def items_count
        raw_artist_data.dig(
          'discography',
          raw_collection_name,
          'totalCount'
        )
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        raw_artist_data = {
          'profile' => {
            'name' => name
          },
          'uri' => spotify_uri
        }

        Spotify::Artist::Albums::Album.call(
          raw_album_data:,
          raw_artists: [raw_artist_data],
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
