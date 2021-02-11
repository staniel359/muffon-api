module Bandcamp
  module Id
    class Base < Bandcamp::Base
      private

      def no_data?
        response_data.blank? || model_response.blank?
      end

      def response_data
        @response_data ||=
          Nokogiri::HTML.parse(response).css('script')
      end

      def model_response_data
        @model_response_data ||= JSON.parse(model_response)
      end
    end
  end
end
