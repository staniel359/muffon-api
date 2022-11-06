module Muffon
  module Utils
    module Request
      USER_AGENT =
        'Mozilla/5.0 (X11; Linux x86_64) ' \
        'AppleWebKit/537.36 (KHTML, like Gecko) ' \
        'Chrome/101.0.4951.41 Safari/537.36'.freeze

      private

      def response_data
        @response_data ||=
          JSON.parse(
            response
          )
      end

      def response
        RestClient.get(
          link, headers
        )
      end

      def post_response
        RestClient.post(
          link, payload, headers
        )
      end

      def headers
        {
          params:,
          cookies:
        }
      end

      def params
        {}
      end

      def cookies
        {}
      end

      def language
        @args[:language] || 'en'
      end

      def user_agent
        USER_AGENT
      end
    end
  end
end
