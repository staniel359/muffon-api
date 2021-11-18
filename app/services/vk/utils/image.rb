module VK
  module Utils
    class Image < VK::Base
      def call
        data
      end

      private

      def data
        return image_data if image.present?

        default_image_data(
          @args[:model]
        )
      end

      def image
        @args[:image]
      end

      def image_data
        return artist_image_data if
            @args[:model] == 'artist'

        {
          original: image['photo_1200'],
          large: image['photo_600'],
          medium: image['photo_300'],
          small: image['photo_135'],
          extrasmall: image['photo_68']
        }
      end

      def artist_image_data
        {
          original: image.dig(3, 'url'),
          large: image.dig(3, 'url'),
          medium: image.dig(3, 'url'),
          small: image.dig(1, 'url'),
          extrasmall: image.dig(2, 'url')
        }
      end
    end
  end
end
