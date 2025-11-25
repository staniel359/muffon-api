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

      def params
        { band_id: @args[:label_id] }
      end

      def data
        { label: label_data }
      end

      alias link artist_label_link
    end
  end
end
