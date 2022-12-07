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
        format_link(
          image
        )
      end

      def format_link(image)
        "#{base_link}/uploads/#{image.key}"
      end

      def base_link
        Rails
          .application
          .credentials
          .url
      end

      def variant_link(size)
        format_link(
          variant(size)
        )
      end

      def variant(size)
        image.variant(
          loader: { page: nil },
          resize_to_fill: [size, size]
        ).processed
      end
    end
  end
end
