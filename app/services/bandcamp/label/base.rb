module Bandcamp
  module Label
    class Base < Bandcamp::Base
      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          label_id
        ]
      end

      def not_found?
        response_data['error'].present?
      end

      def request_url
        "#{REQUEST_BASE_URL}/band_details"
      end

      def request_params
        { band_id: @args[:label_id] }
      end

      def data
        { label: label_data }
      end
    end
  end
end
