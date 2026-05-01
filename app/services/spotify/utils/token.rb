module Spotify
  module Utils
    class Token < Spotify::Base
      REQUEST_BASE_URL = 'https://open.spotify.com/api/token'.freeze

      def call
        data
      end

      private

      def data
        response_data['accessToken']
      end

      def response_data
        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          params: request_params,
          headers: request_headers,
          cookies: request_cookies
        )
      end

      def request_url
        REQUEST_BASE_URL
      end

      def request_params
        {
          'reason' => 'init',
          'productType' => 'web-player',
          'totp' => client_password,
          'totpServer' => server_password,
          'totpVer' => '61'
        }
      end

      def client_password
        return '269604' if test?

        password_data.at(
          current_time
        )
      end

      def password_data
        @password_data ||=
          ROTP::TOTP.new(
            password_secret
          )
      end

      def password_secret
        credentials.dig(
          :spotify,
          :totp_secret
        )
      end

      def server_password
        password_data.at(
          spotify_server_time
        )
      end

      def spotify_server_time
        Spotify::Utils::ServerTime.call
      end

      def request_headers
        { 'User-Agent' => REQUEST_USER_AGENT }
      end

      def request_cookies
        credentials.dig(
          :spotify,
          :cookies
        )
      end
    end
  end
end
