module SoundCloud
  module Utils
    class ClientId < SoundCloud::Base
      REQUEST_BASE_URL = 'https://soundcloud.com'.freeze

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
        response_data.css('script')
      end

      def response_data
        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          response_type: 'html'
        )
      end

      def request_url
        REQUEST_BASE_URL
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
