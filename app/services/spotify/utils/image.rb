module Spotify
  module Utils
    class Image < Spotify::Base
      def call
        return if args_missing?

        data
      end

      private

      def required_args
        %i[
          images
        ]
      end

      def data
        {
          original: image_by_index(0),
          large: large_image,
          medium: medium_image,
          small: image_by_index(-1),
          extrasmall: image_by_index(-1)
        }
      end

      def image_by_index(
        index
      )
        images_sorted.dig(
          index,
          'url'
        )
      end

      def images_sorted
        @images_sorted ||=
          @args[:images]
          .sort_by do |image_data|
            image_data['height']
          end
          .reverse
      end

      def large_image
        image_by_index(-3) ||
          image_by_index(-2) ||
          image_by_index(-1)
      end

      def medium_image
        image_by_index(-2) ||
          image_by_index(-1)
      end
    end
  end
end
