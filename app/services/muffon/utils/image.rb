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
        key = image.key
        filename = image.blob.filename

        "#{base_link}/uploads/#{key}/#{filename}"
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
        options =
          variant_options(size)

        image
          .variant(
            options
          ).processed
      end

      def variant_options(size)
        {
          gravity: 'center',
          extent: '1:1',
          resize: "#{size}x#{size}>",
          loader: loader_data,
          saver: saver_data
        }
      end

      def loader_data
        { page: nil }
      end

      def saver_data
        { allow_splitting: true }
      end
    end
  end
end
