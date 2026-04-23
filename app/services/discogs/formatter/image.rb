module Discogs
  module Formatter
    class Image < Discogs::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          image_url
        ]
      end

      def data
        return if @args[:image_url].blank? || placeholder?

        {
          original: @args[:image_url],
          large: @args[:image_url],
          medium: @args[:image_url],
          small: @args[:image_url],
          extrasmall: @args[:image_url]
        }
      end

      def placeholder?
        @args[:image_url].end_with?(
          '/spacer.gif'
        )
      end
    end
  end
end
