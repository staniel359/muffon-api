module VK
  module Utils
    class Image < VK::Base
      def call
        data
      end

      private

      def data
        return image_data if @args.image.present?

        default_image_data(@args.model)
      end

      def image_data
        return artist_image_data if
            @args.model == 'artist'

        {
          original: @args.image['photo_1200'],
          large: @args.image['photo_600'],
          medium: @args.image['photo_300'],
          small: @args.image['photo_135'],
          extrasmall: @args.image['photo_68']
        }
      end

      def artist_image_data
        {
          original: @args.image.dig(3, 'url'),
          large: @args.image.dig(3, 'url'),
          medium: @args.image.dig(3, 'url'),
          small: @args.image.dig(1, 'url'),
          extrasmall: @args.image.dig(2, 'url')
        }
      end
    end
  end
end
