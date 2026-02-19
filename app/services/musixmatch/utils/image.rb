module MusixMatch
  module Utils
    class Image < MusixMatch::Base
      def call
        return if no_data?

        data
      end

      private

      def no_data?
        @args[:image].blank?
      end

      def data
        {
          original: image_resized('_1200_1200'),
          large: image_resized('_800_800'),
          medium: image_resized('_500_500'),
          small: image_resized('_350_350'),
          extrasmall: image_resized('')
        }
      end

      def image_resized(size)
        @args[:image].sub(
          '_500_500',
          size
        )
      end
    end
  end
end
