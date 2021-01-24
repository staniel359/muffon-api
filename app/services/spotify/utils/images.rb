module Spotify
  module Utils
    class Images < Spotify::Base
      def call
        data
      end

      private

      def data
        return images_data if images_list.present?

        default_images_data(@args.model)
      end

      def images_list
        @args.data.to_h['images']
      end

      def images_data
        {
          original: image_data(0),
          large: image_data(-3),
          medium: image_data(-2),
          small: image_data(-1),
          extrasmall: image_data(-1)
        }
      end

      def image_data(index)
        images_list.dig(index, 'url')
      end
    end
  end
end
