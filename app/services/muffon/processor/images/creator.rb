module Muffon
  module Processor
    module Images
      class Creator < Muffon::Processor::Image::Base
        private

        def data
          images.purge_later if images.attached?

          return if @args[:image_files].blank?

          attach_images

          images_data

          { success: true }
        end

        def images
          @images ||= model.images
        end

        def attach_images
          image_files.each do |i|
            attach_image(i)
          end
        end

        def image_files
          @args[:image_files]
        end

        def attach_image(image_file)
          Muffon::Processor::Images::Creator::Image.call(
            model: @args[:model],
            model_id: @args[:model_id],
            image_file:
          )
        end

        def images_data
          model
            .reload
            .images_data
        end
      end
    end
  end
end
