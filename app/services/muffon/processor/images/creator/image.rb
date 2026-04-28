module Muffon
  module Processor
    module Images
      class Creator
        class Image < Muffon::Processor::Image::Base
          private

          def required_args
            [
              *super,
              :image_file
            ]
          end

          def data
            return if image_file_data.blank?

            attach_image
          end

          def attach_image
            model
              .images
              .attach(
                image_file_data
              )
          end
        end
      end
    end
  end
end
