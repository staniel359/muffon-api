module LastFM
  module Mixins
    module Web
      REQUEST_BASE_URL = 'https://www.last.fm'.freeze

      private

      def response_data
        @response_data ||=
          Muffon::Request.call(
            url: request_url,
            method: 'GET',
            response_type: 'html',
            params: request_params,
            headers: request_headers,
            cookies: request_cookies,
            proxy: request_proxy
          )
      end

      def request_url
        REQUEST_BASE_URL
      end

      def request_params
        {}
      end

      def request_headers
        { 'Accept-Language' => 'en-US,en;q=0.5' }
      end

      def request_cookies
        { lfmanon: '0' }
      end

      def request_proxy
        proxy_data
          .dig(:uk, :ipv6)
          .sample
      end

      def param_formatted(
        param
      )
        CGI.escape(
          CGI.escape(
            super
          )
        )
      end
    end
  end
end
