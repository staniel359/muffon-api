module Muffon
  module Utils
    class Image < Muffon::Base
      def call
        data
      end

      private

      def data
        {
          io: image_io,
          filename: image_filename,
          content_type: image_content_type
        }
      end

      def image_io
        StringIO.new(image_base64)
      end

      def image_base64
        Base64.decode64(
          @args.image.split(',')[1]
        )
      end

      def image_filename
        "image.#{image_extension}"
      end

      def image_extension
        @args.image.split(',')[0].match(
          %r{image/(.+);}
        )[1]
      end

      def image_content_type
        "image/#{image_extension}"
      end
    end
  end
end
