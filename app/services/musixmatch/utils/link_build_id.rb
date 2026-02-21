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
        html_response_data
          .css('script#__NEXT_DATA__')
          .text
      end

      def link
        BASE_LINK
      end
    end
  end
end
