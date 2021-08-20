module SoundCloud
  module Utils
    class ClientId < SoundCloud::Base
      BASE_LINK = 'https://soundcloud.com'.freeze
      SCRIPT_LINK = 'https://a-v2.sndcdn.com/assets/49'.freeze

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
        matched_script['src']
      end

      def matched_script
        scripts.find do |s|
          matched_script?(s)
        end
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

      def matched_script?(script)
        script['src']&.match(
          SCRIPT_LINK
        ).present?
      end
    end
  end
end
