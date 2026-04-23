module AmazonMusic
  module Formatter
    class Image < AmazonMusic::Base
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

      def image_resized(
        size
      )
        'https://m.media-amazon.com/images/I' \
          "/#{image_id}._SX#{size}_SY#{size}_.jpg"
      end

      def image_id
        @image_id ||=
          @args[:image_url].match(
            %r{/images/I/([^.]+)}
          )[1]
      end
    end
  end
end
