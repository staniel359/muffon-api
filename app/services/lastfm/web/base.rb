module LastFM
  module Web
    class Base < LastFM::Base
      private

      def no_data?
        response_data.text.blank?
      end

      def response_data
        @response_data ||= Nokogiri::HTML.parse(response)
      end

      def params
        {}
      end

      def format_param(param)
        CGI.escape(param.to_s.strip).presence
      end
    end
  end
end
