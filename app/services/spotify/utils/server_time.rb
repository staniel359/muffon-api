module Spotify
  module Utils
    class ServerTime < Spotify::Base
      BASE_LINK = 'https://open.spotify.com/api/server-time'.freeze

      def call
        data
      end

      private

      def data
        response_data['serverTime']
      end

      def link
        BASE_LINK
      end
    end
  end
end
