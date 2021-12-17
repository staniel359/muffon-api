require 'open-uri'

module Muffon
  module Utils
    class ImageFile < Muffon::Base
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
        link_image? ? link_image : file_image
      end

      def link_image?
        @args[:image].match(
          %r{https?://}
        )
      end

      def link_image
        @link_image ||= URI.parse(
          @args[:image]
        ).open
      end

      def file_image
        StringIO.new(
          base64_image
        )
      end

      def base64_image
        Base64.decode64(
          @args[:image].split(
            ','
          )[1]
        )
      end

      def image_filename
        image_content_type.sub(
          '/', '.'
        )
      end

      def image_content_type
        @image_content_type ||=
          retrieve_image_content_type
      end

      def retrieve_image_content_type
        return link_image_content_type if link_image?

        file_image_content_type
      end

      def link_image_content_type
        link_image.content_type
      end

      def file_image_content_type
        @args[:image].match(
          %r{(image/.+);}
        )[1]
      end
    end
  end
end
