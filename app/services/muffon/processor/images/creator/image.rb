module Muffon
  module Processor
    module Images
      class Creator
        class Image < Muffon::Processor::Image::Base
          private

          def primary_args
            super + [
              @args[:image_file]
            ]
          end

          def data
            attach_image
          end

          def attach_image
            return if image_file_data.blank?

            images.attach(
              image_file_data
            )
          end

          def images
            @images ||= model.images
          end
        end
      end
    end
  end
end
