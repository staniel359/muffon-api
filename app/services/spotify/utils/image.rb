module Spotify
  module Utils
    class Image < Spotify::Base
      def call
        data
      end

      private

      def data
        return image_data if images_list.present?

        default_image_data(@args.model)
      end

      def images_list
        @images_list ||= @args.data['images']
      end

      def image_data
        {
          original: image(0),
          large: image(-3),
          medium: image(-2),
          small: image(-1),
          extrasmall: image(-1)
        }
      end

      def image(index)
        images_list.dig(index, 'url')
      end
    end
  end
end
