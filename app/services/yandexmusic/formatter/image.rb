module YandexMusic
  module Formatter
    class Image < YandexMusic::Base
      def call
        check_args

        return if @args[:image_url].blank?

        data
      end

      private

      def required_args
        %i[
          image_url
        ]
      end

      def data
        {
          original: image_url_resized('1000'),
          large: image_url_resized('600'),
          medium: image_url_resized('300'),
          small: image_url_resized('100'),
          extrasmall: image_url_resized('50')
        }
      end

      def image_url_resized(size)
        url_formatted =
          @args[:image_url].sub(
            '%%',
            "#{size}x#{size}"
          )

        "https://#{url_formatted}"
      end
    end
  end
end
