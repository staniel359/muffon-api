module Bandcamp
  module Utils
    class Image < Bandcamp::Base
      def call
        data
      end

      private

      def data
        {
          original: image_resized('_10'),
          large: image_resized('_5'),
          medium: image_resized('_4'),
          small: image_resized('_3'),
          extrasmall: image_resized('_42')
        }
      end

      def image_resized(size)
        @args.image.sub(
          /_23|_2|_5|_10/, size
        )
      end
    end
  end
end
