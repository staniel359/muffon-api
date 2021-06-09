module RateYourMusic
  module Utils
    class Image < RateYourMusic::Base
      def call
        data
      end

      private

      def data
        return image_data if @args.image.present?

        default_image_data(@args.model)
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
