module Spotify
  module Utils
    class ServerTime < Spotify::Base
      REQUEST_BASE_URL =
        'https://open.spotify.com/api/server-time'.freeze

      def call
        data
      end

      private

      def data
        response_data['serverTime']
      end

      def response_data
        Muffon::Request.call(
          url: request_url,
          method: 'GET'
        )
      end

      def request_url
        REQUEST_BASE_URL
      end
    end
  end
end
