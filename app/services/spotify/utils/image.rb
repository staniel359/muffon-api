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
          large: large_image,
          medium: medium_image,
          small: image(-1),
          extrasmall: image(-1)
        }
      end

      def large_image
        image(-3) ||
          image(-2) ||
          image(-1)
      end

      def image(index)
        images_sorted.dig(
          index, 'url'
        )
      end

      def images_sorted
        images.sort_by do |i|
          i['height']
        end.reverse
      end

      def medium_image
        image(-2) || image(-1)
      end
    end
  end
end
