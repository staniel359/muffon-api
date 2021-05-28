module Odnoklassniki
  module Utils
    class Image < Odnoklassniki::Base
      def call
        data
      end

      private

      def data
        return image_data if image?

        default_image_data(@args.model)
      end

      def image?
        @args.image.present? && !placeholder?
      end

      def placeholder?
        @args.image.end_with?('stub_album.png')
      end

      def image_data
        {
          original: @args.image,
          large: @args.image,
          medium: @args.image,
          small: @args.image,
          extrasmall: @args.image
        }
      end
    end
  end
end
