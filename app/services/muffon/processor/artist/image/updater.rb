module Muffon
  module Processor
    module Artist
      module Image
        class Updater < Muffon::Processor::Artist::Base
          include Muffon::Utils::Artist

          private

          def primary_args
            super + [
              @args[:image]
            ]
          end

          def no_data?
            find_artist.blank?
          end

          def data
            return if not_all_args? || no_data?

            find_artist.process_image(
              @args[:image]
            )

            find_artist
              .reload
              .image_data
          end
        end
      end
    end
  end
end
