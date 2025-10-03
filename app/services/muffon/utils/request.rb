module Muffon
  module Utils
    module Request
      USER_AGENT =
        'Mozilla/5.0 (X11; Linux x86_64) ' \
        'AppleWebKit/537.36 (KHTML, like Gecko) ' \
        'Chrome/143.0.7445.3 Safari/537.36'.freeze

      include Muffon::Utils::Request::Client

      private

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
            cookies:,
            proxy:
          )
      end

      def format_get_request(
        link:,
        params: {},
        headers: {},
        cookies: {},
        proxy: nil,
        is_redirect: true
      )
        set_cookies(
          headers:,
          cookies:
        )

        client(
          proxy:,
          is_redirect:
        ).get(
          link,
          params,
          headers
        )
      end

      def params
        {}
      end

      def language
        @args[:language] || 'en'
      end

      def headers
        { 'User-Agent' => USER_AGENT }
      end

      def cookies
        {}
      end

      def proxy
        nil
      end

      def proxies
        credentials[:proxy]
      end

      def post_response
        @post_response ||=
          format_post_request(
            link:,
            params:,
            payload:,
            headers:,
            cookies:,
            proxy:
          )
      end

      def format_post_request(
        link:,
        params: {},
        payload: {},
        headers: {},
        cookies: {},
        proxy: nil,
        is_redirect: true
      )
        set_cookies(
          headers:,
          cookies:
        )

        client(
          params:,
          proxy:,
          is_redirect:,
          payload:
        ).post(
          link,
          payload,
          headers
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
