module Odnoklassniki
  module Utils
    class Image < Odnoklassniki::Base
      def call
        data
      end

      private

      def data
        return image_data if @args.image.present?

        default_image_data(@args.model)
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
