module SoundCloud
  module Utils
    class ClientId < SoundCloud::Base
      BASE_LINK = 'https://soundcloud.com'.freeze

      def call
        data
      end

      private

      def data
        script_response
          .body
          .match(
            /client_id:"([\w-]+)"/
          )[1]
      end

      def script_response
        format_get_request(
          link: script_link
        )
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
        html_response_data.css(
          'script'
        )
      end

      def params
        nil
      end

      def link
        BASE_LINK
      end
    end
  end
end
