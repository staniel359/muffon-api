module AmazonMusic
  module Artist
    class Info < AmazonMusic::Artist::Base
      include AmazonMusic::Mixins::Artist

      private

      def request_payload
        {
          'operationName' => 'ArtistSeo',
          'variables' => {
            'id' => @args[:artist_id]
          },
          'extensions' => {
            'clientLibrary' => {
              'name' => '@apollo/client',
              'version' => '4.1.6'
            },
            'persistedQuery' => {
              'version' => 1,
              'sha256Hash' =>
                '15ac3f03bd4f65df9a36a6d91667362c' \
                'd6459fdfd55a8b9734f36a0df57d9c04'
            }
          }
        }.to_json
      end
    end
  end
end
