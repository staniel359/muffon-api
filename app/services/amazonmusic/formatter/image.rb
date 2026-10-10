module AmazonMusic
  module Formatter
    class Image < AmazonMusic::Base
      IMAGES_HOST = 'https://m.media-amazon.com'.freeze

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          image_id
        ]
      end

      def data
        return if @args[:image_id].blank?

        {
          original: image_resized('1000'),
          large: image_resized('600'),
          medium: image_resized('300'),
          small: image_resized('100'),
          extrasmall: image_resized('50')
        }
      end

      def image_resized(
        size
      )
        "#{IMAGES_HOST}/images/I" \
          "/#{@args[:image_id]}._UR#{size},#{size}_.jpg"
      end
    end
  end
end
