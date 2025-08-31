module AmazonMusic
  module Utils
    class Image < AmazonMusic::Base
      def call
        return if no_data?

        data
      end

      private

      def no_data?
        image_link.blank?
      end

      def image_link
        @args[:image_link]
      end

      def data
        {
          original: image_resized('1000'),
          large: image_resized('600'),
          medium: image_resized('300'),
          small: image_resized('100'),
          extrasmall: image_resized('50')
        }
      end

      def image_resized(size)
        'https://m.media-amazon.com/images/I' \
          "/#{image_id}._SX#{size}_SY#{size}_.jpg"
      end

      def image_id
        @image_id ||=
          image_link.match(
            %r{/images/I/([^.]+)}
          )[1]
      end
    end
  end
end
