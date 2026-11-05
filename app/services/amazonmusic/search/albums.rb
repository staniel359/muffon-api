module AmazonMusic
  module Search
    class Albums < AmazonMusic::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'albums',
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
            'specType' => 'album',
            'firstLimit' => limit,
            'afterCursor' => @args[:page],
            'isAuthenticated' => true,
            'audiobooksEnabled' => true,
            'merchEnabled' => false,
            'categoryInEntityUnionEnabled' => false
          },
          'extensions' => {
            'clientLibrary' => {
              'name' => '@apollo/client',
              'version' => '4.1.6'
            },
            'persistedQuery' => {
              'version' => 1,
              'sha256Hash' =>
                'df0336315c5c4419b11bcc3bd16abfc9' \
                'dd0d2df4422fe3a6a83da7b8520eb316'
            }
          }
        }.to_json
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        AmazonMusic::Search::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
