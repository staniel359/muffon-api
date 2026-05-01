module YouTube
  module Formatter
    class Image < YouTube::Base
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
          original: image_resized(1000, 'maxres'),
          large: image_resized(600, 'sd'),
          medium: image_resized(300, 'hq'),
          small: image_resized(100, 'mq'),
          extrasmall: image_resized(50, '')
        }
      end

      def image_resized(
        size,
        size_name
      )
        if @args[:image_url].include?('=s88')
          @args[:image_url].sub(
            's88',
            "s#{size}"
          )
        else
          @args[:image_url].sub(
            'default',
            "#{size_name}default"
          )
        end
      end
    end
  end
end
