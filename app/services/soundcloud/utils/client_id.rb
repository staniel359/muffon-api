module SoundCloud
  module Utils
    class ClientId < SoundCloud::Base
      BASE_LINK =
        'https://a-v2.sndcdn.com/assets/49-f0e7e434.js'.freeze

      def call
        data
      end

      private

      def data
        response.match(
          /client_id:"([\w\-]+)"/
        )[1]
      end

      def response
        RestClient.get(BASE_LINK)
      end
    end
  end
end
