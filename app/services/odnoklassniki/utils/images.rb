module Odnoklassniki
  module Utils
    class Images < Odnoklassniki::Base
      def call
        data
      end

      private

      def data
        return images_data if @args.image.present?

        default_images_data(@args.model)
      end

      def images_data
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
