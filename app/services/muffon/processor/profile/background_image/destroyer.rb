module Muffon
  module Processor
    module Profile
      module BackgroundImage
        class Destroyer < Muffon::Processor::Profile::BackgroundImage::Base
          private

          def primary_args
            super + [
              @args[:image_id]
            ]
          end

          def process_background_image
            background_image&.purge_later

            { success: true }
          end

          def background_image
            profile.background_images.find_by(
              id: @args[:image_id]
            )
          end
        end
      end
    end
  end
end
