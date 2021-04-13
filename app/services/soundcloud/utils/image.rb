module SoundCloud
  module Utils
    class Image < SoundCloud::Base
      def call
        data
      end

      private

      def data
        return image_data if image.present?

        default_image_data(@args.model)
      end

      def image
        @args.data.to_h['artwork_url']
      end

      def image_data
        {
          original: crop_image('t500x500'),
          large: crop_image('t500x500'),
          medium: crop_image('t300x300'),
          small: crop_image('large'),
          extrasmall: crop_image('t67x67')
        }
      end

      def crop_image(size)
        @args.data['artwork_url'].sub('large', size)
      end
    end
  end
end
