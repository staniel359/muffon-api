module Deezer
  module Utils
    class Image < Deezer::Base
      IMAGE_MODELS = {
        artist: 'artist',
        album: 'cover',
        track: 'cover'
      }.freeze

      def call
        data
      end

      private

      def data
        return if image_id.blank?

        image_data
      end

      def image_id
        @args[:image_id]
      end

      def image_data
        {
          original: image_resized('1000x1000'),
          large: image_resized('600x600'),
          medium: image_resized('300x300'),
          small: image_resized('100x100'),
          extrasmall: image_resized('50x50')
        }
      end

      def image_resized(size)
        image.sub(
          '1000x1000', size
        )
      end

      def image
        @image ||=
          'https://cdns-images.dzcdn.net'\
          "/images/#{image_model}/#{image_id}"\
          '/1000x1000-000000-80-0-0.jpg'
      end

      def image_model
        IMAGE_MODELS[
          @args[:model].to_sym
        ]
      end
    end
  end
end
