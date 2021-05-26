module LastFM
  module Web
    class Base < LastFM::Base
      private

      def response_data
        @response_data ||= Nokogiri::HTML.parse(
          response
        )
      end

      def params
        {}
      end

      def param_formatted(param)
        CGI.escape(super)
      end
    end
  end
end
