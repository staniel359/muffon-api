module MusixMatch
  module Formatter
    class Image < MusixMatch::Base
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
          original: image_resized('_1200_1200'),
          large: image_resized('_800_800'),
          medium: image_resized('_500_500'),
          small: image_resized('_350_350'),
          extrasmall: image_resized('')
        }
      end

      def image_resized(size)
        @args[:image_url].sub(
          '_500_500',
          size
        )
      end
    end
  end
end
