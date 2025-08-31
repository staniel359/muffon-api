module LastFM
  module Utils
    module Web
      include Muffon::Utils::Request

      private

      def response
        format_get_request(
          link:,
          params:,
          headers:,
          cookies:,
          proxy:
        )
      end

      def params
        {}
      end

      def headers
        { 'User-Agent' => USER_AGENT }
      end

      def cookies
        { lfmanon: '0' }
      end

      def proxy
        credentials.dig(
          :proxy,
          :us
        )
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

      alias response_data html_response_data
    end
  end
end
