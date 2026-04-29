module Muffon
  module Processor
    module Images
      class Creator < Muffon::Processor::Image::Base
        private

        def data
          model_record.delete_images_later!

          attach_images

          images_data

          { success: true }
        end

        def attach_images
          image_files.each do |image_file|
            attach_image(
              image_file
            )
          end
        end

        def image_files
          @args[:image_files] || []
        end

        def attach_image(
          image_file
        )
          image_file_data =
            Muffon::Formatter::Image::FileData.call(
              image: image_file
            )

          model_record.add_image_to_images!(
            image_file_data:
          )
        end

        def images_data
          model_record
            .reload
            .images_data
        end
      end
    end
  end
end
