module Discogs
  module Utils
    class Images < Discogs::Base
      def call
        data
      end

      private

      def data
        return images_data if image_present?

        default_images_data(@args.model)
      end

      def image_present?
        @args.image.present? &&
          !@args.image.end_with?('/spacer.gif')
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
