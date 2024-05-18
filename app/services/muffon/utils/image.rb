module Muffon
  module Utils
    class Image < Muffon::Base
      def call
        data
      end

      private

      def data
        return if image.blank?

        {
          original: original_link,
          large: variant_link(600),
          medium: variant_link(300),
          small: variant_link(100),
          extrasmall: variant_link(50)
        }
      end

      def image
        @args[:image]
      end

      def original_link
        image.url
      rescue StandardError
        nil
      end

      def variant_link(size)
        Muffon::Utils::Image::VariantLink.call(
          image:,
          size:
        )
      end
    end
  end
end
