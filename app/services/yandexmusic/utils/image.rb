module YandexMusic
  module Utils
    class Image < YandexMusic::Base
      def call
        return if args_missing? || no_data?

        data
      end

      private

      def required_args
        %i[
          data
        ]
      end

      def no_data?
        image.blank?
      end

      def image
        image_url ||
          image_url_alternative
      end

      def image_url
        @args[:data].dig(
          'cover',
          'uri'
        )
      end

      def image_url_alternative
        @args[:data]['coverUri']
      end

      def data
        {
          original: image_resized_formatted('1000'),
          large: image_resized_formatted('600'),
          medium: image_resized_formatted('300'),
          small: image_resized_formatted('100'),
          extrasmall: image_resized_formatted('50')
        }
      end

      def image_resized_formatted(size)
        "https://#{image_resized(size)}"
      end

      def image_resized(size)
        image.sub(
          '%%',
          "#{size}x#{size}"
        )
      end
    end
  end
end
