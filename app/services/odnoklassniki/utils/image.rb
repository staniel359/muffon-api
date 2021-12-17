module Odnoklassniki
  module Utils
    class Image < Odnoklassniki::Base
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
