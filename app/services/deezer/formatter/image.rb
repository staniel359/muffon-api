module Deezer
  module Formatter
    class Image < Deezer::Base
      MODELS_DATA = {
        'artist' => 'artist',
        'album' => 'cover',
        'track' => 'cover'
      }.freeze

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          image_id
        ]
      end

      def data
        return if @args[:image_id].blank?

        {
          original: image_resized('1000x1000'),
          large: image_resized('600x600'),
          medium: image_resized('300x300'),
          small: image_resized('100x100'),
          extrasmall: image_resized('50x50')
        }
      end

      def image_resized(size)
        image.sub('1000x1000', size)
      end

      def image
        @image ||=
          'https://cdns-images.dzcdn.net' \
          "/images/#{image_model}/#{@args[:image_id]}" \
          '/1000x1000-000000-80-0-0.jpg'
      end

      def image_model
        MODELS_DATA[@args[:model]]
      end
    end
  end
end
