module Spotify
  module Utils
    class Token < Spotify::Base
      BASE_LINK = 'https://accounts.spotify.com/api/token'.freeze

      def call
        data
      rescue *errors
        nil
      end

      private

      def data
        response_data['access_token']
      end

      def link
        BASE_LINK
      end

      def payload
        {
          grant_type:
            'client_credentials'
        }
      end

      def headers
        {
          'Authorization' =>
            "Basic #{auth_token}"
        }
      end

      def auth_token
        Base64.strict_encode64(
          raw_token
        )
      end

      def raw_token
        "#{client_id}:#{client_secret}"
      end

      def client_id
        secrets.spotify[:api_key]
      end

      def client_secret
        secrets.spotify[:api_secret]
      end

      def errors
        [
          RestClient::BadRequest,
          RestClient::BadGateway
        ]
      end

      alias response post_response
    end
  end
end
