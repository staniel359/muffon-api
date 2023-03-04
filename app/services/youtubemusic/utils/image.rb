module YouTubeMusic
  module Utils
    class Image < Muffon::Base
      def call
        data
      end

      private

      def data
        return if @args[:image].blank?

        {
          original: image_resized(1200, 'maxres'),
          large: image_resized(600, 'sd'),
          medium: image_resized(300, 'hq'),
          small: image_resized(100, 'mq'),
          extrasmall: image_resized(50, '')
        }
      end

      def image_resized(size, prefix)
        @args[:image].sub(
          'w60-h60-l90-rj',
          "w#{size}-h#{size}-l100"
        ).sub(
          /(sd|hq)default.+/,
          "#{prefix}default.jpg"
        )
      end
    end
  end
end
