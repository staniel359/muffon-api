module SoundCloud
  module Utils
    class Image < SoundCloud::Base
      def call
        data
      end

      private

      def data
        return if image.blank?

        image_data
      end

      def image
        @args[:image]
      end

      def image_data
        {
          original: image_resized('t500x500'),
          large: image_resized('t500x500'),
          medium: image_resized('t300x300'),
          small: image_resized('large'),
          extrasmall: image_resized('t67x67')
        }
      end

      def image_resized(size)
        image.sub('large', size)
      end
    end
  end
end
