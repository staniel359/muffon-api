module SoundCloud
  module Utils
    class ClientId < SoundCloud::Base
      BASE_LINK = 'https://soundcloud.com'.freeze

      def call
        data
      end

      private

      def data
        script_client_id_data.dig(
          'data',
          'id'
        )
      end

      def script_client_id_data
        script_data.find do |data|
          data['hydratable'] == 'apiClient'
        end
      end

      def script_data
        JSON.parse(
          raw_script_data
        )
      end

      def raw_script_data
        matched_script
          .text
          .match(
            /window.__sc_hydration = (.+);$/
          )[1]
      end

      def matched_script
        scripts.find do |script|
          matched_script?(script)
        end
      end

      def scripts
        html_response_data.css(
          'script'
        )
      end

      def link
        BASE_LINK
      end

      def params
        nil
      end

      def proxy
        nil
      end

      def matched_script?(script)
        script
          .text
          .starts_with?(
            'window.__sc_hydration'
          )
      end
    end
  end
end
