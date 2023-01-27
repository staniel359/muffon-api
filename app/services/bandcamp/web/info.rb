module Bandcamp
  module Web
    class Info < Bandcamp::Base
      private

      def primary_args
        [@args[:link]]
      end

      def data
        JSON.parse(
          raw_data
        )
      end

      def raw_data
        script['data-embed']
      end

      def script
        scripts.xpath(
          "//*[contains(@src, 'tralbum_head')]"
        )[0]
      end

      def scripts
        response_data.css(
          'script'
        )
      end

      def response_data
        Nokogiri::HTML.parse(
          response
        )
      end

      def link
        @args[:link]
      end
    end
  end
end
