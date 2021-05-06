module Spotify
  module Utils
    class Token < Spotify::Base
      def call
        retrieve_token
      rescue RestClient::BadRequest
        handlers.bad_request
      end

      private

      def retrieve_token
        JSON.parse(response)['access_token']
      end

      def response
        RestClient.post(link, params, headers)
      end

      def link
        'https://accounts.spotify.com/api/token'
      end

      def params
        { grant_type: 'client_credentials' }
      end

      def headers
        { 'Authorization' => "Basic #{auth_token}" }
      end

      def auth_token
        Base64.strict_encode64("#{client_id}:#{client_secret}")
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
