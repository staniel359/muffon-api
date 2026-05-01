module YouTubeMusic
  module Formatter
    class Image < YouTubeMusic::Base
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
        @args[:image_url]
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
