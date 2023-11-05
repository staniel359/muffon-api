module Muffon
  module Processor
    module Image
      class Creator < Muffon::Processor::Image::Base
        private

        def data
          image.purge_later if image.attached?

          return if @args[:image_file].blank?

          attach_image

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
      end
    end
  end
end
