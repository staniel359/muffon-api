module LastFM
  module Utils
    module Web
      include Muffon::Utils::Request

      private

      def params
        {}
      end

      def headers
        {
          'Cookie' => 'lfmanon=0',
          'User-Agent' => USER_AGENT,
          'Accept-Language' => 'en-US,en;q=0.5'
        }
      end

      def proxy
        proxies[:us]
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
