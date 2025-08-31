require 'open-uri'

module Muffon
  module Utils
    class Image
      class FileData < Muffon::Base
        def call
          return if no_data?

          data
        end

        private

        def no_data?
          image.blank?
        end

        def image
          @image ||=
            @args[:image] ||
            temp_image
        end

        def temp_image
          return unless temp_image_file_present?

          content =
            temp_image_file.read

          temp_image_file.close

          ::File.delete(
            temp_image_file_path
          )

          content
        end

        def temp_image_file_present?
          temp_image_file_path.present? &&
            ::File.exist?(
              temp_image_file_path
            )
        end

        def temp_image_file_path
          @args[:temp_image_file_path]
        end

        def temp_image_file
          @temp_image_file ||=
            ::File.open(
              temp_image_file_path
            )
        end

        def data
          if link_image?
            link_image_data
          else
            file_image_data
          end
        end

        def link_image?
          image.match?(
            %r{https?://}
          )
        end

        def link_image_data
          image_data(
            stream: link_image,
            file_name:
              link_image_filename,
            content_type:
              link_image_content_type
          )
        end

        def image_data(
          stream:,
          file_name:,
          content_type:
        )
          {
            io: stream,
            filename: file_name,
            content_type:
          }
        end

        def link_image
          @link_image ||=
            URI.parse(image).open
        end

        def link_image_filename
          link_image_content_type
            .sub('/', '.')
        end

        def link_image_content_type
          link_image.content_type
        end

        def file_image_data
          image_data(
            stream: file_image_stream,
            file_name:
              file_image_filename,
            content_type:
              file_image_content_type
          )
        end

        def file_image_stream
          StringIO.new(
            file_image_base64_data
          )
        end

        def file_image_base64_data
          Base64.decode64(
            file_image_raw_base64_data
          )
        end

        def file_image_raw_base64_data
          image.split(',')[1]
        end

        def file_image_filename
          file_image_content_type
            .sub('/', '.')
        end

        def file_image_content_type
          @file_image_content_type ||=
            image.match(%r{(image/.+);})[1]
        end
      end
    end
  end
end
