module Muffon
  module Processor
    module Image
      class Creator < Muffon::Processor::Image::Base
        private

        def primary_args
          super + [
            @args[:image_file]
          ]
        end

        def data
          image.purge_later if image.attached?

          return if image_file == 'DELETED'

          attach_image

          image_data if @args[:preload]

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
