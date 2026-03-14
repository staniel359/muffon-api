module Spotify
  module Search
    class Artists < Spotify::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'artists',
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
          'artists',
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
          'operationName' => 'searchArtists',
          'extensions' => {
            'persistedQuery' => {
              'version' => 1,
              'sha256Hash' => '72c8c7c1e789a9f11e261c4f9ae35a9465bbb90137c584428989573617b6c08d' # rubocop:disable Layout/LineLength
            }
          }
        }.to_json
      end

      def items_count
        response_data.dig(
          'data',
          'searchV2',
          'artists',
          'totalCount'
        )
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        Spotify::Search::Artists::Artist.call(
          raw_artist_data:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
