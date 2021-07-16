module SoundCloud
  module Utils
    class ClientId < SoundCloud::Base
      BASE_LINK = 'https://soundcloud.com'.freeze

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
        RestClient.get(script_link)
      end

      def script_link
        scripts[-2]['src']
      end

      def scripts
        scripts_response_data.css(
          'script'
        )
      end

      def scripts_response_data
        Nokogiri::HTML.parse(
          scripts_response
        )
      end

      def scripts_response
        RestClient.get(BASE_LINK)
      end
    end
  end
end
