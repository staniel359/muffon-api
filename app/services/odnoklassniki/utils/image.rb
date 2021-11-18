module Odnoklassniki
  module Utils
    class Image < Odnoklassniki::Base
      def call
        data
      end

      private

      def data
        return image_data if image?

        default_image_data(
          @args[:model]
        )
      end

      def image?
        image.present? && !placeholder?
      end

      def image
        @args[:image]
      end

      def placeholder?
        image.end_with?(
          'stub_album.png'
        )
      end

      def image_data
        {
          original: image,
          large: image,
          medium: image,
          small: image,
          extrasmall: image
        }
      end
    end
  end
end
