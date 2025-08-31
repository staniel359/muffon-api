module Muffon
  module Processor
    module Image
      class Creator < Muffon::Processor::Image::Base
        private

        def data
          model_image.purge_later if model_image.attached?

          attach_image if image_file_data.present?

          image_data

          { success: true }
        end

        def model_image
          @model_image ||= model.image
        end

        def attach_image
          model_image.attach(
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
