module Muffon
  module Processor
    module Profile
      module BackgroundImage
        class Creator < Muffon::Processor::Profile::BackgroundImage::Base
          private

          def primary_args
            super + [
              @args[:image]
            ]
          end

          def process_background_image
            background_image

            {
              background_image:
                background_image_data
            }
          end

          def background_image
            @background_image ||=
              profile.process_background_image(
                @args[:image]
              )
          end

          def background_image_data
            Muffon::Utils::BackgroundImage.call(
              image: background_image
            )
          end
        end
      end
    end
  end
end
