module Muffon
  module Formatter
    class Image < Muffon::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          image
        ]
      end

      def data
        return if @args[:image].blank?

        {
          original: original_link,
          large: variant_link(600),
          medium: variant_link(300),
          small: variant_link(100),
          extrasmall: variant_link(50)
        }
      end

      def original_link
        image_link(
          image_key: @args[:image].key
        )
      end

      def image_link(
        image_key:
      )
        "#{host}/images/#{image_key}"
      end

      def host
        credentials[:url]
      end

      def variant_link(
        size
      )
        image_variant =
          @args[:image]
          .variant(
            variant_options(size:)
          )
          .processed

        image_link(
          image_key: image_variant.key
        )
      end

      def variant_options(
        size:
      )
        {
          background: 'none',
          gravity: 'center',
          extent: '1:1',
          resize: "#{size}x#{size}>"
        }
      end
    end
  end
end
