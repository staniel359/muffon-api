module Muffon
  module Utils
    class Image < Muffon::Base
      def call
        return if args_missing?

        data
      end

      private

      def required_args
        %i[
          image
        ]
      end

      def data
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
        image_link(image)
      end

      def image_link(image)
        "#{host}/images/#{image.key}"
      end

      def host
        credentials[:url]
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
