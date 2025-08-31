module VK
  module Utils
    class Image < VK::Base
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
        if artist?
          artist_image_data
        else
          image_data
        end
      end

      def artist?
        @args[:model] == 'artist'
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

      def image
        @args[:image]
      end

      def image_data
        {
          original: image['photo_1200'],
          large: image['photo_600'],
          medium: image['photo_300'],
          small: image['photo_135'],
          extrasmall: image['photo_68']
        }
      end
    end
  end
end
