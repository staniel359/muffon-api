module Spotify
  module Search
    class Albums < Spotify::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count:
        )
      end

      def raw_collection
        response_data.dig(
          'data',
          'searchV2',
          'albumsV2',
          'items'
        )
      end

      def payload
        {
          'variables' => {
            'includePreReleases' => false,
            'numberOfTopResults' => 20,
            'searchTerm' => @args[:query],
            'offset' => offset,
            'limit' => limit,
            'includeAudiobooks' => true,
            'includeAuthors' => false
          },
          'operationName' => 'searchAlbums',
          'extensions' => {
            'persistedQuery' => {
              'version' => 1,
              'sha256Hash' => '5e7d2724fbef31a25f714844bf1313ffc748ebd4bd199eaad50628a4f246a7ab' # rubocop:disable Layout/LineLength
            }
          }
        }.to_json
      end

      def items_count
        response_data.dig(
          'data',
          'searchV2',
          'albumsV2',
          'totalCount'
        )
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        Spotify::Search::Albums::Album.call(
          raw_album_data:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
