module Spotify
  module Utils
    class Token < Spotify::Base
      BASE_LINK = 'https://open.spotify.com/api/token'.freeze

      def call
        data
      end

      private

      def data
        response_data['accessToken']
      end

      def link
        BASE_LINK
      end

      def params
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

      def headers
        { 'User-Agent' => USER_AGENT }
      end

      def cookies
        credentials.dig(
          :spotify,
          :cookies
        )
      end
    end
  end
end
