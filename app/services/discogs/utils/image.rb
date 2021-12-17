module Discogs
  module Utils
    class Image < Discogs::Base
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
          '/spacer.gif'
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
