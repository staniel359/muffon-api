module LastFM
  module Utils
    class ImagesData < LastFM::Base
      def call
        images_data
      end

      private

      def images_data
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
        @args.image || data_image || default_image
      end

      def data_image
        return if @args.data.blank?

        @args.data['image'].last['#text'].presence
      end

      def default_image
        return '' if @args.model.blank?

        send("#{@args.model}_default_image")
      end

      def artist_default_image
        'https://lastfm.freetls.fastly.net/i/u/300x300/'\
        '2a96cbd8b46e442fc41c2b86b821562f.png'
      end

      def album_default_image
        'https://lastfm.freetls.fastly.net/i/u/300x300/'\
        'c6f59c1e5e7240a4c0d427abd71f3dbb.png'
      end
    end
  end
end
