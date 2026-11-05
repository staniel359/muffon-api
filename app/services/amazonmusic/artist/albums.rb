module AmazonMusic
  module Artist
    class Albums < AmazonMusic::Artist::Base
      private

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
          is_infinite: true,
          next_page:
        )
      end

      def raw_collection
        raw_artist_data.dig(
          'releases',
          'edges'
        ) || []
      end

      def request_payload
        {
          'operationName' => 'ChronologicalAlbumsPage',
          'variables' => {
            'id' => @args[:artist_id],
            'firstLimit' => limit,
            'isAuthenticated' => true,
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
                '21accd6e4c2fa6ad0a0323ee60eba50a' \
                'fa8a22ff8f581e9e4602e87508e3214a'
            }
          }
        }.to_json
      end

      def next_page
        raw_artist_data.dig(
          'releases',
          'pageInfo',
          'token'
        )
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        AmazonMusic::Artist::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
