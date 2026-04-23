module Genius
  module Formatter
    class Image < Genius::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          image_url
        ]
      end

      def data
        return if @args[:image_url].blank?

        {
          original: image_resized('1000'),
          large: image_resized('600'),
          medium: image_resized('300'),
          small: image_resized('100'),
          extrasmall: image_resized('50')
        }
      end

      def image_resized(size)
        "https://t2.genius.com/unsafe/#{size}x0/#{@args[:image_url]}"
      end
    end
  end
end
