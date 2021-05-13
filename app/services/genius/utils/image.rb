module Genius
  module Utils
    class Image < Bandcamp::Base
      def call
        data
      end

      private

      def data
        {
          original: @args.image,
          large: @args.image,
          medium: @args.image,
          small: @args.image,
          extrasmall: @args.image
        }
      end
    end
  end
end
