module RateYourMusic
  module Utils
    class Image < RateYourMusic::Base
      def call
        data
      end

      private

      def data
        return image_data if image_present?

        default_image_data(@args.model)
      end

      def image_present?
        @args.image.present? && !placeholder?
      end

      def placeholder?
        @args.image.end_with?('blockeds.png')
      end

      def image_data
        {
          original: image_formatted,
          large: image_formatted,
          medium: image_formatted,
          small: image_formatted,
          extrasmall: image_formatted
        }
      end

      def image_formatted
        "https:#{@args.image}"
      end
    end
  end
end
