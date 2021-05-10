module SoundCloud
  module Utils
    class ClientId < SoundCloud::Base
      def call
        data
      end

      private

      def data
        response.body.match(/client_id=(\w+)/)[1]
      end

      def response_data
        RestClient.get(link).body
      end

      def link
        'https://a-v2.sndcdn.com/assets/3-1810168b.js'
      end
    end
  end
end
