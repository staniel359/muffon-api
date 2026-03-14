module Spotify
  module Artist
    class Info < Spotify::Artist::Base
      private

      def payload
        {
          'variables' => {
            'uri' => spotify_uri,
            'preReleaseV2' => false
          },
          'operationName' => 'queryArtistOverview',
          'extensions' => {
            'persistedQuery' => {
              'version' => 1,
              'sha256Hash' => '5b9e64f43843fa3a9b6a98543600299b0a2cbbbccfdcdcef2402eb9c1017ca4c' # rubocop:disable Layout/LineLength
            }
          }
        }.to_json
      end
    end
  end
end
