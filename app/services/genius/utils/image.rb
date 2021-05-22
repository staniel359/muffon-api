module Genius
  module Utils
    class Image < Genius::Base
      def call
        data
      end

      private

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
        'https://t2.genius.com/unsafe'\
          "/#{size}x0/#{@args.image}"
      end
    end
  end
end
