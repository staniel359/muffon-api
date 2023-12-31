module Muffon
  module Utils
    module Request
      USER_AGENT =
        'Mozilla/5.0 (X11; Linux x86_64) ' \
        'AppleWebKit/537.36 (KHTML, like Gecko) ' \
        'Chrome/101.0.4951.41 Safari/537.36'.freeze

      include Muffon::Utils::Request::Client

      private

      def params = {}

      def headers = {}

      def cookies = {}

      def language
        @args[:language] || 'en'
      end

      def proxy
        secrets.proxy[:ru]
      end

      def response_data
        @response_data ||=
          JSON.parse(
            response.body
          )
      end

      def response
        @response ||=
          format_get_request(
            link:,
            params:,
            headers:,
            cookies:
          )
      end

      def format_get_request(
        link:,
        params: {},
        headers: {},
        cookies: {},
        proxy: nil,
        redirect: true
      )
        set_cookies(
          headers:, cookies:
        )

        client(
          proxy:,
          redirect:
        ).get(
          link, params, headers
        )
      end

      def post_response
        @post_response ||=
          format_post_request(
            link:,
            params:,
            payload:,
            headers:,
            cookies:
          )
      end

      def format_post_request(
        link:,
        params: {},
        payload: {},
        headers: {},
        cookies: {},
        proxy: nil,
        redirect: true
      )
        set_cookies(
          headers:, cookies:
        )

        client(
          params:, proxy:,
          redirect:, payload:
        ).post(
          link, payload, headers
        )
      end

      def html_response_data
        @html_response_data ||=
          Nokogiri::HTML.parse(
            response.body
          )
      end
    end
  end
end
