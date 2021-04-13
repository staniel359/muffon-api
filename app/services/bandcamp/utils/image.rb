module Bandcamp
  module Utils
    class Image < Bandcamp::Base
      def call
        data
      end

      private

      def data
        {
          original: resized_image('_10'),
          large: resized_image('_5'),
          medium: resized_image('_4'),
          small: resized_image('_3'),
          extrasmall: resized_image('_42')
        }
      end

      def resized_image(size)
        @args.image.sub(/_23|_2|_5|_10/, size)
      end
    end
  end
end
