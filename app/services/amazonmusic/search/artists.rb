module AmazonMusic
  module Search
    class Artists < AmazonMusic::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'artists',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def request_payload
        {
          'operationName' => 'SpecSearchSeeMorePage',
          'variables' => {
            'searchText' => @args[:query],
            'specType' => 'artist',
            'firstLimit' => limit,
            'isAuthenticated' => true,
            'audiobooksEnabled' => true,
            'merchEnabled' => false,
            'categoryInEntityUnionEnabled' => false,
            'afterCursor' => @args[:page]
          },
          'extensions' => {
            'clientLibrary' => {
              'name' => '@apollo/client',
              'version' => '4.1.6'
            },
            'persistedQuery' => {
              'version' => 1,
              'sha256Hash' =>
                'a56e537d67f08be3baf17a4e1dd52b1f' \
                'cfce1231b1ead35bc06f5f11635cb3c8'
            }
          }
        }.to_json
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        AmazonMusic::Search::Artists::Artist.call(
          raw_artist_data:,
          **self_args
        )
      end
    end
  end
end
