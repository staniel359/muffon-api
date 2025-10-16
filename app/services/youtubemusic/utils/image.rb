module YouTubeMusic
  module Utils
    class Image < Muffon::Base
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
          original: image_resized(1200, 'maxres'),
          large: image_resized(600, 'sd'),
          medium: image_resized(300, 'hq'),
          small: image_resized(100, 'mq'),
          extrasmall: image_resized(50, '')
        }
      end

      def image_resized(
        size,
        prefix
      )
        @args[:image]
          .sub(
            /w(\d+)-h(\d+)/,
            "w#{size}-h#{size}"
          )
          .sub(
            /(sd|hq)default/,
            "#{prefix}default"
          )
      end
    end
  end
end
