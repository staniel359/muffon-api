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

      def link
        "#{BASE_LINK}/band_details"
      end

      def params
        { band_id: @args[:label_id] }
      end

      def data
        { label: label_data }
      end
    end
  end
end
