module LastFM
  module Utils
    class Image < LastFM::Base
      BASE_LINK =
        'https://lastfm.freetls.fastly.net'.freeze

      def call
        data
      end

      private

      def data
        return if image.blank?

        image_data
      end

      def image
        @args[:image].presence
      end

      def image_data
        {
          original: image_resized(''),
          large: image_resized('/600x600'),
          medium: image_resized('/300x300'),
          small: image_resized('/174s'),
          extrasmall: image_resized('/60x60')
        }
      end

      def image_resized(size)
        image
          .sub('/avatar170s', size)
          .sub('/174s', size)
          .sub('/270x205', size)
          .sub('/300x300', size)
          .sub(%r{(.+)(?=/i/u)}, BASE_LINK)
      end
    end
  end
end
