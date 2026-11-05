module AmazonMusic
  module Search
    class Tracks < AmazonMusic::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'tracks',
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
            'specType' => 'track',
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
                'df0336315c5c4419b11bcc3bd16abfc9' \
                'dd0d2df4422fe3a6a83da7b8520eb316'
            }
          }
        }.to_json
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        AmazonMusic::Search::Tracks::Track.call(
          raw_track_data:,
          is_with_query_match: @args[:with_automatch],
          query_title: @args[:track_title],
          query_artist_name: @args[:artist_name],
          **self_args
        )
      end
    end
  end
end
