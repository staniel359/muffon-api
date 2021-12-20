module Muffon
  module Processor
    module Artist
      module Image
        class Updater < Muffon::Processor::Artist::Base
          private

          def data
            find_artist.process_image(
              @args[:image_url]
            )
          end
        end
      end
    end
  end
end
