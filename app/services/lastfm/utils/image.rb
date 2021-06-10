module LastFM
  module Utils
    class Image < LastFM::Base
      MODEL_HASHES = {
        artist: '2a96cbd8b46e442fc41c2b86b821562f',
        album: 'c6f59c1e5e7240a4c0d427abd71f3dbb',
        track: '4128a6eb29f94943c9d206c08e625904'
      }.freeze
      YOUTUBE_PLACEHOLDER = 'https://i.ytimg.com'.freeze

      def call
        data
      end

      private

      def data
        {
          original: image_resized(''),
          large: image_resized('/600x600'),
          medium: image_resized('/300x300'),
          small: image_resized('/174s'),
          extrasmall: image_resized('/64s')
        }
      end

      def image_resized(size)
        image
          .sub('/avatar170s', size)
          .sub('/270x205', size)
          .sub('/300x300', size)
      end

      def image
        @args.image.presence || default_image
      end

      def default_image
        return YOUTUBE_PLACEHOLDER if @args.model == 'video'

        'https://lastfm.freetls.fastly.net'\
          "/i/u/300x300/#{model_hash}.png"
      end

      def model_hash
        MODEL_HASHES[model_key]
      end

      def model_key
        (@args.model || 'artist').to_sym
      end
    end
  end
end
