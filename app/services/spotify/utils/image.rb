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
        @args.data.to_h['images']
      end

      def image_data
        {
          original: images(0),
          large: images(-3),
          medium: images(-2),
          small: images(-1),
          extrasmall: images(-1)
        }
      end

      def images(index)
        images_list.dig(index, 'url')
      end
    end
  end
end
