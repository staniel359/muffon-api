module Odnoklassniki
  module Formatter
    class Image < Odnoklassniki::Base
      def call
        check_args

        return if @args[:image_url].blank? || placeholder?

        data
      end

      private

      def required_args
        %i[
          image_url
        ]
      end

      def placeholder?
        @args[:image_url].end_with?(
          'stub_album.png'
        )
      end

      def data
        {
          original: @args[:image_url],
          large: @args[:image_url],
          medium: @args[:image_url],
          small: @args[:image_url],
          extrasmall: @args[:image_url]
        }
      end
    end
  end
end
