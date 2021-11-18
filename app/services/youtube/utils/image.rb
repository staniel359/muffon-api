module YouTube
  module Utils
    class Image < Muffon::Base
      def call
        data
      end

      private

      def data
        {
          original: image_resized('maxres'),
          large: image_resized('sd'),
          medium: image_resized('hq'),
          small: image_resized('mq'),
          extrasmall: image_resized('')
        }
      end

      def image_resized(size)
        image.sub(
          'default', "#{size}default"
        )
      end

      def image
        @args[:image]
      end
    end
  end
end
