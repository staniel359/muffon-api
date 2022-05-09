module Spotify
  module Utils
    class Image < Spotify::Base
      def call
        data
      end

      private

      def data
        return if images.blank?

        image_data
      end

      def images
        @args[:images]
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
        images.dig(
          index, 'url'
        )
      end
    end
  end
end
