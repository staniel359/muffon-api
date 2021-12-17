module RateYourMusic
  module Utils
    class Image < RateYourMusic::Base
      def call
        data
      end

      private

      def data
        return unless image_present?

        image_data
      end

      def image_present?
        image.present? && !placeholder?
      end

      def image
        @args[:image]
      end

      def placeholder?
        image.end_with?(
          'blockeds.png'
        )
      end

      def image_data
        {
          original: image_formatted,
          large: image_formatted,
          medium: image_formatted,
          small: image_formatted,
          extrasmall: image_formatted
        }
      end

      def image_formatted
        "https:#{image}"
      end
    end
  end
end
