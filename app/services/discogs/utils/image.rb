module Discogs
  module Utils
    class Image < Discogs::Base
      def call
        data
      end

      private

      def data
        return image_data if image_present?

        default_image_data(@args.model)
      end

      def image_present?
        @args.image.present? &&
          !@args.image.end_with?('/spacer.gif')
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
