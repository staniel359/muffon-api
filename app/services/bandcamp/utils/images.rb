module Bandcamp
  module Utils
    class Images < Bandcamp::Base
      def call
        data
      end

      private

      def data
        {
          original: image,
          large: image.sub('_10', '_5'),
          medium: image.sub('_10', '_4'),
          small: image.sub('_10', '_3'),
          extrasmall: image.sub('_10', '_42')
        }
      end

      def image
        "https://f4.bcbits.com/img/a#{@args.image_id}_10.jpg"
      end
    end
  end
end
