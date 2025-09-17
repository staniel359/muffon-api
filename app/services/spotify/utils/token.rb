module Spotify
  module Utils
    class Token < Spotify::Base
      BASE_LINK =
        'https://accounts.spotify.com/api/token'.freeze

      def call
        return if not_all_args?

        data
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
        if test?
          secrets.spotify[:api_key]
        else
          api_secrets[:key]
        end
      end

      def client_secret
        if test?
          secrets.spotify[:api_secret]
        else
          api_secrets[:secret]
        end
      end

      def api_secrets
        @api_secrets ||=
          secrets
            .spotify[:api]
            .sample
      end

      alias response post_response
    end
  end
end
