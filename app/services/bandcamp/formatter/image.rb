module Bandcamp
  module Formatter
    class Image < Bandcamp::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          image_url
        ]
      end

      def data
        return if @args[:image_url].blank?

        {
          original: image_resized('_10'),
          large: image_resized('_5'),
          medium: image_resized('_4'),
          small: image_resized('_3'),
          extrasmall: image_resized('_42')
        }
      end

      def image_resized(
        size
      )
        @args[:image_url].sub(
          /_23|_2|_5|_10/,
          size
        )
      end
    end
  end
end
