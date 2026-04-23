module LastFM
  module Mixins
    module Web
      include Muffon::Mixins::Request

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

      alias response_data html_response_data
    end
  end
end
