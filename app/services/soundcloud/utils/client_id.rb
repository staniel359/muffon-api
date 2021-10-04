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
        soundcloud_scripts[-1]['src']
      end

      def soundcloud_scripts
        scripts.select do |s|
          matched_script?(s)
        end
      end

      def matched_script?(script)
        script['src']&.match(
          'https://a-v2.sndcdn.com/assets'
        ).present?
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
