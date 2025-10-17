module YouTube
  module Utils
    class Image < Muffon::Base
      def call
        check_args

        return if no_data?

        data
      end

      private

      def no_data?
        @args[:images].blank? &&
          @args[:image].blank?
      end

      def data
        case @args[:model]
        when 'search_video', 'search_playlist'
          search_image_data
        when 'channel'
          channel_image_data
        when 'similar_video'
          similar_video_image_data
        when 'video', 'playlist'
          image_data
        else
          plain_image_data
        end
      end

      def search_image_data
        {
          original: search_image_resized('maxres'),
          large: search_image_resized('sd'),
          medium: search_image_resized('hq'),
          small: search_image_resized('mq'),
          extrasmall: search_image_resized('')
        }
      end

      def search_image_resized(
        prefix
      )
        image_resized(
          'default'
        )
          .sub(
            'default',
            "#{prefix}default"
          )
      end

      def image_resized(
        size_key
      )
        @args[:images].dig(
          size_key,
          'url'
        )
      end

      def channel_image_data
        {
          original: channel_image_resized(1000),
          large: channel_image_resized(600),
          medium: channel_image_resized(300),
          small: channel_image_resized(100),
          extrasmall: channel_image_resized(50)
        }
      end

      def channel_image_resized(
        size
      )
        image_resized(
          'default'
        )
          .sub(
            's88',
            "s#{size}"
          )
      end

      def similar_video_image_data
        {
          original: similar_image_resized('maxres'),
          large: similar_image_resized('sd'),
          medium: similar_image_resized('hq'),
          small: similar_image_resized('mq'),
          extrasmall: similar_image_resized('')
        }
      end

      def similar_image_resized(
        prefix
      )
        @args[:image].sub(
          /(sd|hq)default/,
          "#{prefix}default"
        )
      end

      def plain_image_data
        {
          original: @args[:image],
          large: @args[:image],
          medium: @args[:image],
          small: @args[:image],
          extrasmall: @args[:image]
        }
      end

      def image_data
        {
          original:
            image_resized('maxres') ||
              image_resized('standard') ||
              image_resized('high'),
          large:
            image_resized('standard') ||
              image_resized('high'),
          medium: image_resized('high'),
          small: image_resized('medium'),
          extrasmall: image_resized('default')
        }
      end
    end
  end
end
