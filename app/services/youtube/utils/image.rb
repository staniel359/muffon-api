module YouTube
  module Utils
    class Image < Muffon::Base
      def call
        data
      end

      private

      def data
        return if @args[:image].blank?

        {
          original: image_resized('maxres', ''),
          large: image_resized('sd', 's600'),
          medium: image_resized('hq', 's300'),
          small: image_resized('mq', 's100'),
          extrasmall: image_resized('', 's50')
        }
      end

      def image_resized(prefix_one, prefix_two)
        @args[:image].sub(
          'hqdefault', 'default'
        ).sub(
          'default',
          "#{prefix_one}default"
        ).sub(
          's88', prefix_two
        ).split(
          '?sqp='
        )[0]
      end
    end
  end
end
