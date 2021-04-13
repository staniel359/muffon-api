module LastFM
  module Utils
    class Image < LastFM::Base
      def call
        image_data
      end

      private

      def image_data
        {
          original: crop_image(''),
          large: crop_image('/600x600'),
          medium: crop_image('/300x300'),
          small: crop_image('/174s'),
          extrasmall: crop_image('/64s')
        }
      end

      def crop_image(size)
        image
          .sub('/avatar170s', size)
          .sub('/270x205', size)
          .sub('/300x300', size)
      end

      def image
        return @args.image if @args.image.present?
        return data_image if data_image.present?
        return default_image if @args.model.present?

        ''
      end

      def data_image
        return if @args.data.blank?

        @args.data['image'].last['#text']
      end

      def default_image
        send("default_#{@args.model}_image")
      end

      def default_artist_image
        'https://lastfm.freetls.fastly.net/i/u/300x300/'\
        '2a96cbd8b46e442fc41c2b86b821562f.png'
      end

      def default_album_image
        'https://lastfm.freetls.fastly.net/i/u/300x300/'\
        'c6f59c1e5e7240a4c0d427abd71f3dbb.png'
      end

      def default_track_image
        'https://lastfm.freetls.fastly.net/i/u/300x300/'\
        '4128a6eb29f94943c9d206c08e625904.png'
      end
    end
  end
end
