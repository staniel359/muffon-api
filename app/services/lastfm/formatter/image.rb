module LastFM
  module Formatter
    class Image < LastFM::Base
      BASE_LINK = 'https://lastfm.freetls.fastly.net'.freeze
      DEFAULT_IDS_DATA = {
        'artist' => '2a96cbd8b46e442fc41c2b86b821562f',
        'album' => 'c6f59c1e5e7240a4c0d427abd71f3dbb',
        'track' => '4128a6eb29f94943c9d206c08e625904',
        'user' => '818148bf682d429dc215c1705eb27b98'
      }.freeze

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
        return if @args[:image_url].blank? || default_image?

        {
          original: image_resized(''),
          large: image_resized('/600x600'),
          medium: image_resized('/300x300'),
          small: image_resized('/174s'),
          extrasmall: image_resized('/60x60')
        }
      end

      def default_image?
        DEFAULT_IDS_DATA.values.any? do |image_id|
          @args[:image_url].include?(
            image_id
          )
        end
      end

      def image_resized(size)
        @args[:image_url]
          .sub('/avatar170s', size)
          .sub('/174s', size)
          .sub('/270x205', size)
          .sub('/300x300', size)
          .sub('/64s', size)
          .sub(%r{(.+)(?=/i/u)}, BASE_LINK)
      end
    end
  end
end
