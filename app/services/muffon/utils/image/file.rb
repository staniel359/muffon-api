require 'open-uri'

module Muffon
  module Utils
    class Image
      class File < Muffon::Base
        def call
          # return {} if not_all_args?

          data
        end

        private

        # def primary_args
        #   [@args[:image]]
        # end

        def data
          { image: image_data }
        end

        def image_data
          return if image_content_type.blank?

          {
            io: image_io,
            filename: image_filename,
            content_type: image_content_type
          }
        rescue OpenURI::HTTPError
          nil
        end

        def image_content_type
          return link_image_content_type if link_image?

          file_image_content_type
        end

        def link_image?
          image.match(
            %r{https?://}
          )
        end

        def image
          @image ||=
            @args[:image] ||
              read_temp_image_file
        end

        def read_temp_image_file
          file =
            ::File.open(
              @args[:temp_image_file_path]
            )

          text = file.read

          file.close

          ::File.delete(file)

          text
        end

        def link_image_content_type
          link_image.content_type
        end

        def link_image
          @link_image ||= URI.parse(
            image
          ).open
        end

        def file_image_content_type
          image.match(
            %r{(image/.+);}
          ).try(
            :[], 1
          ) || ''
        end

        def image_io
          return link_image if link_image?

          file_image
        end

        def file_image
          StringIO.new(
            base64_image
          )
        end

        def base64_image
          Base64.decode64(
            base64_image_data
          )
        end

        def base64_image_data
          image.split(
            ','
          )[1]
        end

        def image_filename
          image_content_type.sub(
            '/', '.'
          )
        end
      end
    end
  end
end
