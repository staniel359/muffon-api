module SoundCloud
  module Formatter
    class Image < SoundCloud::Base
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
          original: image_resized('t500x500'),
          large: image_resized('t500x500'),
          medium: image_resized('t300x300'),
          small: image_resized('large'),
          extrasmall: image_resized('t67x67')
        }
      end

      def image_resized(size)
        @args[:image_url].sub(
          'large',
          size
        )
      end
    end
  end
end
