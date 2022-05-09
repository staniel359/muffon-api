module YandexMusic
  module Utils
    class Image < YandexMusic::Base
      def call
        data
      end

      private

      def data
        return if image.blank?

        image_data
      end

      def image
        return if @args[:data].blank?

        image_url || image_url_alternative
      end

      def image_url
        @args[:data].dig(
          'cover', 'uri'
        )
      end

      def image_url_alternative
        @args[:data]['coverUri']
      end

      def image_data
        {
          original: image_formatted('1000'),
          large: image_formatted('600'),
          medium: image_formatted('300'),
          small: image_formatted('100'),
          extrasmall: image_formatted('50')
        }
      end

      def image_formatted(size)
        "https://#{image_resized(size)}"
      end

      def image_resized(size)
        image.sub(
          '%%', "#{size}x#{size}"
        )
      end
    end
  end
end
