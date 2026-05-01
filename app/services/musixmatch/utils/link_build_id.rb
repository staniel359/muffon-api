module MusixMatch
  module Utils
    class LinkBuildId < MusixMatch::Base
      def call
        data
      end

      private

      def data
        JSON.parse(raw_data)['buildId']
      end

      def raw_data
        response_data
          .css('script#__NEXT_DATA__')
          .text
      end

      def response_data
        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          response_type: 'html',
          cookies: request_cookies
        )
      end

      def request_url
        REQUEST_BASE_URL
      end
    end
  end
end
