module Genius
  module Utils
    class Image < Genius::Base
      def call
        data
      end

      private

      def data
        {
          original: crop_image('1000'),
          large: crop_image('600'),
          medium: crop_image('300'),
          small: crop_image('100'),
          extrasmall: crop_image('50')
        }
      end

      def crop_image(size)
        'https://t2.genius.com/unsafe'\
          "/#{size}x0/#{@args.image}"
      end
    end
  end
end
