module SoundCloud
  module Utils
    class Image < SoundCloud::Base
      def call
        return if args_missing?

        data
      end

      private

      def required_args
        %i[
          image
        ]
      end

      def data
        {
          original: image_resized('t500x500'),
          large: image_resized('t500x500'),
          medium: image_resized('t300x300'),
          small: image_resized('large'),
          extrasmall: image_resized('t67x67')
        }
      end

      def image_resized(size)
        @args[:image].sub(
          'large',
          size
        )
      end
    end
  end
end
