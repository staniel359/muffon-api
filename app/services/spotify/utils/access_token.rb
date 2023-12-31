module Spotify
  module Utils
    class AccessToken < Spotify::Base
      BASE_LINK =
        'https://accounts.spotify.com/api/token'.freeze

      def call
        return if not_all_args?

        data
      rescue StandardError
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
            "Basic #{auth_token}",
          'Content-Type' =>
            'application/x-www-form-urlencoded'
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

      alias response post_response
    end
  end
end
