module Spotify
  module Album
    class Base < Spotify::Base
      include Spotify::Utils::Album

      def call
        check_args

        check_if_not_found

        data
      rescue Faraday::UnauthorizedError
        retry_with_new_spotify_token
      end

      private

      def required_args
        %i[
          album_id
        ]
      end

      def not_found?
        raw_album_data.blank?
      end

      def raw_album_data
        response_data.dig(
          'data',
          'albumUnion'
        )
      end

      def payload
        {
          'variables' => {
            'uri' => spotify_uri,
            'offset' => 0,
            'limit' => 250
          },
          'operationName' => 'getAlbum',
          'extensions' => {
            'persistedQuery' => {
              'version' => 1,
              'sha256Hash' => 'b9bfabef66ed756e5e13f68a942deb60bd4125ec1f1be8cc42769dc0259b4b10' # rubocop:disable Layout/LineLength
            }
          }
        }.to_json
      end

      def spotify_uri
        "spotify:album:#{@args[:album_id]}"
      end

      def data
        { album: album_data }
      end

      alias response post_response
    end
  end
end
