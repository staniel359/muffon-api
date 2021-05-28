module RateYourMusic
  module Utils
    class Image < RateYourMusic::Base
      def call
        data
      end

      private

      def data
        return image_data if image?

        default_image_data(@args.model)
      end

      def image?
        @args.image_data.present? && !placeholder?
      end

      def placeholder?
        @args.image_data['class'].include?(
          'image_release_blank'
        )
      end

      def image_data
        {
          original: image_formatted(medium),
          large: image_formatted(medium),
          medium: image_formatted(medium),
          small: image_formatted(small),
          extrasmall: image_formatted(extrasmall)
        }
      end

      def image_formatted(image)
        "https://#{image}"
      end

      def medium
        matched_image(tiptip)
      end

      def matched_image(string)
        string.match(%r{e.snmc.io[\w/]+})[0]
      end

      def tiptip
        nodes.find do |n|
          n.name.in?(%w[tiptip data-tiptip])
        end.value
      end

      def nodes
        @nodes ||= @args.image_data.attribute_nodes
      end

      def small
        matched_image(
          srcset.split(',')[1]
        )
      end

      def srcset
        @srcset ||= nodes.find do |n|
          n.name.in?(%w[srcset data-srcset])
        end.value
      end

      def extrasmall
        matched_image(
          srcset.split(',')[0]
        )
      end
    end
  end
end
