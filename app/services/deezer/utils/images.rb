module Deezer
  module Utils
    class Images < Deezer::Base
      def call
        data
      end

      private

      def data
        return images_data if image.present?

        default_images_data(@args.model)
      end

      def image
        @image ||= @args.data && image_url
      end

      def image_url
        @args.data['picture_xl'] || @args.data['cover_xl']
      end

      def images_data
        {
          original: crop_image('1200x1200'),
          large: crop_image('600x600'),
          medium: crop_image('300x300'),
          small: crop_image('100x100'),
          extrasmall: crop_image('50x50')
        }
      end

      def crop_image(size)
        image.sub('1000x1000', size)
      end
    end
  end
end
