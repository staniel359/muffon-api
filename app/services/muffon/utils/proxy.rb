module Muffon
  module Utils
    class Proxy < Muffon::Base
      SERVERS_COUNT = 10

      class << self
        def call(args = {})
          new(args).call
        end
      end

      def call
        return if not_all_args?

        data
      rescue Faraday::ConnectionFailed
        call_again
      end

      private

      def primary_args
        [@args[:link]]
      end

      def data
        format_get_request(
          link:,
          params:,
          cookies:
            cookies_formatted
        )
      end

      def link
        html_response_data.css(
          'meta[http-equiv=refresh]'
        )[0]['content'].split(
          'url='
        )[1]
      end

      def response
        format_post_request(
          link: base_link,
          payload:
        )
      end

      def base_link
        "http://server#{random_server_number}.kproxy.com/doproxy.jsp"
      end

      def random_server_number
        return 10 if test?

        rand(1..SERVERS_COUNT)
      end

      def payload
        { page: @args[:link] }
      end

      def params
        @args[:params] || {}
      end

      def cookies_formatted
        proxy_cookies
          .merge(cookies)
      end

      def proxy_cookies
        { 'KP_DAT2__' => kproxy_cookie }
      end

      def kproxy_cookie
        secrets.kproxy[:cookie]
      end

      def cookies
        @args[:cookies] || {}
      end
    end
  end
end
