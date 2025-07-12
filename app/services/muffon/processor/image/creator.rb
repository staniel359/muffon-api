module Muffon
  module Processor
    module Image
      class Creator < Muffon::Processor::Image::Base
        private

        def data
          image.purge_later if image.attached?

          if @args[:image_file].blank? && @args[:temp_image_file_path].blank?
            return
          end

          attach_image

          image_data

          { success: true }
        end

        def image
          @image ||= model.image
        end

        def attach_image
          return if image_file_data.blank?

          image.attach(
            image_file_data
          )
        end

        def image_data
          model
            .reload
            .image_data
        end
      end
    end
  end
end
