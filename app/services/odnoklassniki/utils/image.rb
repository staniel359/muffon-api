module Odnoklassniki
  module Utils
    class Image < Odnoklassniki::Base
      def call
        return if no_data?

        data
      end

      private

      def no_data?
        image.blank? ||
          placeholder?
      end

      def image
        @args[:image]
      end

      def placeholder?
        image.end_with?(
          'stub_album.png'
        )
      end

      def data
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
