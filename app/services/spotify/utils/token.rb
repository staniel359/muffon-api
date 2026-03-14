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
          'totp' => password,
          'totpServer' => password,
          'totpVer' => '61'
        }
      end

      def password
        return '269604' if test?

        @password ||= password_data.now
      end

      def password_data
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
