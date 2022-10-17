module YouTube
  module Utils
    class Image < Muffon::Base
      def call
        data
      end

      private

      def data
        return if @args[:image].blank?

        {
          original: image_resized('maxres'),
          large: image_resized('sd'),
          medium: image_resized('hq'),
          small: image_resized('mq'),
          extrasmall: image_resized('')
        }
      end

      def image_resized(size)
        @args[:image].sub(
          'default',
          "#{size}default"
        )
      end
    end
  end
end
