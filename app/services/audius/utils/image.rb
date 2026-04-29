module Audius
  module Utils
    class Image < Audius::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          images_data
        ]
      end

      def data
        return if @args[:images_data].blank?

        {
          original: images[0],
          large: images[0],
          medium: images[1],
          small: images[2],
          extrasmall: images[2]
        }
      end

      def images
        @args[:images_data].values
      end
    end
  end
end
