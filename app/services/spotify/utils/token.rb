module Spotify
  module Utils
    class Token < Spotify::Base
      BASE_LINK = 'https://accounts.spotify.com/api/token'.freeze

      def call
        data
      rescue RestClient::BadRequest
        bad_request
      end

      private

      def data
        JSON.parse(response)['access_token']
      end

      def response
        RestClient.post(link, params, headers)
      end

      def link
        BASE_LINK
      end

      def params
        { grant_type: 'client_credentials' }
      end

      def headers
        { 'Authorization' => "Basic #{auth_token}" }
      end

      def auth_token
        Base64.strict_encode64(raw_token)
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
    end
  end
end
